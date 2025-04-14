import 'package:ems/src/core/utils/toast_util.dart';
import 'package:ems/src/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';

import '../../../core/base/base_cubit_wrapper.dart';
import '../../../core/base/cubit_status.dart';
import '../../../core/helpers/debouncer.dart';
import '../../../core/services/navigation_service.dart';
import '../../../data/models/error/error_model.dart';
import '../../../data/models/profession/profession_model.dart';
import '../../../domain/entities/profession/profession_entity.dart';
import '../../../domain/repositories/profession/profession_repository.dart';
import '../../ui/screens.dart';

part 'profession_state.dart';
part 'profession_cubit.freezed.dart';

@singleton
class ProfessionCubit extends BaseCubitWrapper<ProfessionState> {
  final ProfessionRepository _repository;

  ProfessionCubit(this._repository) : super(initState) {
    _init();
    fetchProfessions();
  }

  void _init() {
    controllers = List.generate(1, (index) => TextEditingController());
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late List<TextEditingController> controllers;
  final Debouncer _debouncer = Debouncer(
    delay: const Duration(milliseconds: 300),
  );

  static ProfessionState get initState => ProfessionState(
    status: CubitStatus.initial(),
    profession: ProfessionModel(id: Uuid().v4()),
    professions: <ProfessionModel>[],
    errors: ErrorModel(),
  );

  // Clean up resources when cubit is disposed
  @override
  Future<void> close() {
    for (var controller in controllers) {
      controller.dispose();
    }
    _debouncer.cancel();
    return super.close();
  }

  // MARK: - Repository Methods

  Future<void> fetchProfessions() async {
    emit(state.copyWith(status: CubitStatus.loading()));

    final result = await _repository.getProfessions();

    result.fold(
      (failure) => emit(
        state.copyWith(status: CubitStatus.error(message: failure.message)),
      ),
      (professions) {
        final professionModels =
            professions
                .map((entity) => ProfessionModel.fromJson(entity.toJson()))
                .toList();

        emit(
          state.copyWith(
            status: CubitStatus.success(),
            professions: professionModels,
          ),
        );
      },
    );
  }

  Future<void> getProfessionById(String id) async {
    emit(state.copyWith(status: CubitStatus.loading()));

    final result = await _repository.getProfessionById(id);

    result.fold(
      (failure) => emit(
        state.copyWith(status: CubitStatus.error(message: failure.message)),
      ),
      (profession) {
        final professionModel = ProfessionModel.fromJson(profession.toJson());
        emit(
          state.copyWith(
            status: CubitStatus.success(),
            profession: professionModel,
          ),
        );

        // Update text controller with profession name
        controllers[0].text = professionModel.name ?? '';
      },
    );
  }

  Future<void> searchProfessions(String query) async {
    emit(state.copyWith(status: CubitStatus.loading()));

    final result = await _repository.searchProfessions(query);

    result.fold(
      (failure) => emit(
        state.copyWith(status: CubitStatus.error(message: failure.message)),
      ),
      (professions) {
        final professionModels =
            professions
                .map((entity) => ProfessionModel.fromJson(entity.toJson()))
                .toList();

        emit(
          state.copyWith(
            status: CubitStatus.success(),
            professions: professionModels,
          ),
        );
      },
    );
  }

  // MARK: - State Management Methods

  void updateState(ProfessionState newState) {
    emit(newState);
  }

  void setProfessionData(ProfessionModel? profession) {
    emit(state.copyWith(profession: profession));
  }

  // MARK: - Form Management Methods

  void clearProfessionForm() {
    emit(
      state.copyWith(
        profession: ProfessionModel(id: Uuid().v4()),
        errors: ErrorModel(),
        status: CubitStatus.initial(),
      ),
    );
    for (var controller in controllers) {
      controller.clear();
    }
    formKey.currentState?.reset();
  }

  void clearField(String fieldName) {
    switch (fieldName) {
      case 'name':
        controllers[0].clear();
        updateState(
          state.copyWith(profession: state.profession?.copyWith(name: '')),
        );
        break;
    }
  }

  void updateField(String fieldName, String value) {
    _debouncer.run(() {
      switch (fieldName) {
        case 'name':
          updateState(
            state.copyWith(profession: state.profession?.copyWith(name: value)),
          );
          break;
      }
    });
  }

  // MARK: - Validation Methods

  String? validateName(String? value, AppLocalizations localization) {
    if (value == null || value.trim().isEmpty) {
      updateState(
        state.copyWith(
          errors: state.errors?.copyWith(
            fullName: localization.errorProfessionName,
          ),
        ),
      );
      return localization.errorProfessionName;
    }
    if (value.length < 3) {
      updateState(
        state.copyWith(
          errors: state.errors?.copyWith(
            fullName: localization.errorProfessionNameLength,
          ),
        ),
      );
      return localization.errorProfessionNameLength;
    }

    updateState(state.copyWith(errors: state.errors?.copyWith(fullName: null)));
    return null;
  }

  bool isSaveDisabled() {
    // Return true when form has errors or is incomplete
    final hasErrors = state.errors?.hasError() ?? false;
    final isIncomplete = (state.profession?.isComplete() ?? false);
    return hasErrors || isIncomplete;
  }

  // MARK: - Action Methods

  Future<void> handleSave(
    BuildContext context,
    ProfessionModel? originalProfession,
  ) async {
    if (formKey.currentState?.validate() ?? false) {
      emit(state.copyWith(status: CubitStatus.loading()));

      try {
        if (originalProfession == null) {
          // Create new profession
          final profession = state.profession?.copyWith(
            id: Uuid().v4(),
            createdAt: DateTime.now(),
          );
          if (profession != null) {
            final professionEntity = ProfessionEntity.fromJson(
              profession.copyWith(updatedAt: DateTime.now()).toJson(),
            );
            final result = await _repository.addProfession(professionEntity);

            result.fold(
              (failure) => emit(
                state.copyWith(
                  status: CubitStatus.error(message: failure.message),
                ),
              ),
              (id) {
                final updatedProfession = profession.copyWith(id: id);
                emit(
                  state.copyWith(
                    status: CubitStatus.success(),
                    profession: updatedProfession,
                  ),
                );
                ToastUtil().showSuccessToast(
                  AppLocalizations.of(context)!.professionAdded,
                );
              },
            );
          }
        } else {
          // Update existing profession
          final profession = state.profession?.copyWith(
            id: originalProfession.id ?? Uuid().v4(),
            updatedAt: DateTime.now(),
          );
          if (profession != null) {
            final professionEntity = ProfessionEntity.fromJson(
              profession.toJson(),
            );
            final result = await _repository.updateProfession(professionEntity);

            result.fold(
              (failure) => emit(
                state.copyWith(
                  status: CubitStatus.error(message: failure.message),
                ),
              ),
              (_) {
                ToastUtil().showSuccessToast(
                  AppLocalizations.of(context)!.professionUpdated,
                );
              },
            );
          }
        }
        fetchProfessions();
        clearProfessionForm();
        injector<NavigationService>().pop();
      } catch (e) {
        emit(state.copyWith(status: CubitStatus.error(message: e.toString())));
        debugPrint('Error saving profession: $e');
      }
    }
  }

  Future<void> deleteProfession(String id) async {
    emit(state.copyWith(status: CubitStatus.loading()));

    final result = await _repository.deleteProfession(id);

    result.fold(
      (failure) => emit(
        state.copyWith(status: CubitStatus.error(message: failure.message)),
      ),
      (_) {
        emit(state.copyWith(status: CubitStatus.success()));
        fetchProfessions(); // Refresh the list after deletion
      },
    );
  }

  Future<void> deleteAllProfessions() async {
    emit(state.copyWith(status: CubitStatus.loading()));

    final result = await _repository.deleteAllProfessions();

    result.fold(
      (failure) => emit(
        state.copyWith(status: CubitStatus.error(message: failure.message)),
      ),
      (_) {
        emit(state.copyWith(status: CubitStatus.success()));
        fetchProfessions(); // Refresh the list after deletion
      },
    );
  }

  void handleCancel(BuildContext context, ProfessionModel? profession) {
    if (profession == null) {
      clearProfessionForm();
    }

    if (context.canPop()) {
      context.pop();
    } else {
      context.pushReplacementNamed(DashboardScreen.name);
    }
  }
}
