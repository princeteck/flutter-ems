import 'dart:async';

import 'package:ems/src/domain/repositories/employee/employee_repository.dart';
import 'package:flutter/material.dart'
    show FormState, GlobalKey, ScaffoldMessenger, SnackBar;

import 'package:ems/src/core/base/base_cubit_wrapper.dart';
import 'package:ems/src/core/helpers/debouncer.dart';
import 'package:ems/src/l10n/app_localizations.dart';
import 'package:ems/src/presentation/ui/screens.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:uih/uih.dart';
import 'package:uuid/uuid.dart';

import '../../../core/base/cubit_status.dart';
import '../../../data/models/employee/employee_model.dart';
import '../../../data/models/error/error_model.dart';
import '../../../domain/entities/employee/employee_entity.dart';
import '../../widgets/widgets.dart';

part 'employee_state.dart';
part 'employee_cubit.freezed.dart';

@lazySingleton
class EmployeeCubit extends BaseCubitWrapper<EmployeeState> {
  EmployeeCubit() : super(initState) {
    _init();
  }

  void _init() {
    controllers = List.generate(2, (index) => TextEditingController());
    _repository = injector<EmployeeRepository>();
    // Load employees when cubit initializes
    fetchAllEmployees();
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late List<TextEditingController> controllers;
  late EmployeeRepository _repository;
  final Debouncer _debouncer = Debouncer(
    delay: const Duration(milliseconds: 300),
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

  static EmployeeState get initState => EmployeeState(
    status: CubitStatus.initial(),
    employee: EmployeeModel(),
    employees: <EmployeeModel>[],
    errors: ErrorModel(),
  );

  // MARK: - State Management Methods

  void updateState(EmployeeState newState) {
    emit(newState);
  }

  void setEmployeeData(EmployeeModel? employee) {
    emit(state.copyWith(employee: employee));
  }

  // MARK: - Repository Integration Methods

  /// Fetch all employees from the repository
  Future<void> fetchAllEmployees() async {
    emit(state.copyWith(status: CubitStatus.loading()));

    final result = await _repository.getAllEmployees();
    fetchEmployeesCount();

    result.fold(
      (failure) {
        emit(
          state.copyWith(status: CubitStatus.error(message: failure.message)),
        );
        debugPrint('Error fetching employees: ${failure.message}');
      },
      (employees) {
        final employeeModels =
            employees.map((entity) {
              var model = entity.toJson();
              if (entity.profession != null) {
                model['profession'] = entity.profession!.toJson();
              }
              return EmployeeModel.fromJson(model);
            }).toList();

        emit(
          state.copyWith(
            status: CubitStatus.success(),
            employees: employeeModels,
          ),
        );
      },
    );
  }

  /// Fetch employees count
  Future<int> fetchEmployeesCount() async {
    emit(state.copyWith(status: CubitStatus.loading()));

    final result = await _repository.getEmployeeCount();

    return result.fold(
      (failure) {
        emit(
          state.copyWith(status: CubitStatus.error(message: failure.message)),
        );
        debugPrint('Error fetching employee count: ${failure.message}');
        return 0;
      },
      (count) {
        emit(
          state.copyWith(status: CubitStatus.success(), employeesCount: count),
        );
        return count;
      },
    );
  }

  /// Get employee by ID from repository
  Future<void> fetchEmployeeById(String id) async {
    emit(state.copyWith(status: CubitStatus.loading()));

    final result = await _repository.getEmployeeById(id);

    result.fold(
      (failure) {
        emit(
          state.copyWith(status: CubitStatus.error(message: failure.message)),
        );
        debugPrint('Error fetching employee: ${failure.message}');
      },
      (employee) {
        final employeeModel = EmployeeModel.fromJson(employee.toJson());
        emit(
          state.copyWith(
            status: CubitStatus.success(),
            employee: employeeModel,
          ),
        );

        // Update form fields with fetched data
        controllers[0].text = employeeModel.fullName ?? '';
        controllers[1].text = employeeModel.email ?? '';
      },
    );
  }

  /// Search employees by query string
  Future<void> searchEmployees(String query) async {
    if (query.isEmpty) {
      return fetchAllEmployees();
    }

    emit(state.copyWith(status: CubitStatus.loading()));

    final result = await _repository.searchEmployees(query);

    result.fold(
      (failure) {
        emit(
          state.copyWith(status: CubitStatus.error(message: failure.message)),
        );
        debugPrint('Error searching employees: ${failure.message}');
      },
      (employees) {
        final employeeModels =
            employees
                .map((entity) => EmployeeModel.fromJson(entity.toJson()))
                .toList();
        emit(
          state.copyWith(
            status: CubitStatus.success(),
            employees: employeeModels,
          ),
        );
      },
    );
  }

  /// Get employees by profession ID
  Future<void> getEmployeesByProfessionId(String professionId) async {
    emit(state.copyWith(status: CubitStatus.loading()));

    final result = await _repository.getEmployeesByProfessionId(professionId);

    result.fold(
      (failure) {
        emit(
          state.copyWith(status: CubitStatus.error(message: failure.message)),
        );
        debugPrint(
          'Error fetching employees by profession: ${failure.message}',
        );
      },
      (employees) {
        final employeeModels =
            employees
                .map((entity) => EmployeeModel.fromJson(entity.toJson()))
                .toList();
        emit(
          state.copyWith(
            status: CubitStatus.success(),
            employees: employeeModels,
          ),
        );
      },
    );
  }

  /// Delete an employee by ID
  Future<void> deleteEmployee(
    String id,
    BuildContext context,
    AppLocalizations localization,
  ) async {
    emit(state.copyWith(status: CubitStatus.loading()));

    final result = await _repository.deleteEmployee(id);

    result.fold(
      (failure) {
        emit(
          state.copyWith(status: CubitStatus.error(message: failure.message)),
        );
        _showErrorSnackBar(
          context: context,
          message: localization.errorDeletingEmployee,
        );
        debugPrint('Error deleting employee: ${failure.message}');
      },
      (_) {
        // Refresh employee list
        fetchAllEmployees();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(localization.employeeDeletedSuccessfully),
            backgroundColor: context.colorScheme.error,
          ),
        );
      },
    );
  }

  // MARK: - Form Management Methods

  void clearEmployeeForm() {
    for (var controller in controllers) {
      controller.clear();
    }
    formKey.currentState?.reset();
    emit(state.copyWith(employee: EmployeeModel(), errors: ErrorModel()));
  }

  void clearField(String fieldName) {
    switch (fieldName) {
      case 'fullName':
        controllers[0].clear();
        setEmployeeData(state.employee?.copyWith(fullName: ''));
        break;
      case 'email':
        controllers[1].clear();
        setEmployeeData(state.employee?.copyWith(email: ''));
        break;
    }
  }

  void updateField(String fieldName, String value) {
    _debouncer.run(() {
      switch (fieldName) {
        case 'fullName':
          setEmployeeData(state.employee?.copyWith(fullName: value));
          break;
        case 'email':
          setEmployeeData(state.employee?.copyWith(email: value));
          break;
      }
    });
  }

  // MARK: - Validation Methods

  String? validateEmail(String? value, AppLocalizations localization) {
    if (value == null || value.trim().isEmpty) {
      updateState(
        state.copyWith(
          errors: state.errors?.copyWith(
            email: localization.pleaseEnterAValidEmail,
          ),
        ),
      );
      return localization.pleaseEnterAValidEmail;
    }

    final emailRegExp = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');

    if (!emailRegExp.hasMatch(value)) {
      updateState(
        state.copyWith(
          errors: state.errors?.copyWith(
            email: localization.pleaseEnterAValidEmail,
          ),
        ),
      );
      return localization.pleaseEnterAValidEmail;
    }

    updateState(state.copyWith(errors: state.errors?.copyWith(email: null)));
    return null;
  }

  String? validateFullName(String? value, AppLocalizations localization) {
    if (value == null || value.trim().isEmpty) {
      updateState(
        state.copyWith(
          errors: state.errors?.copyWith(
            fullName: localization.pleaseEnterAValidFullName,
          ),
        ),
      );
      return localization.pleaseEnterAValidFullName;
    }

    updateState(state.copyWith(errors: state.errors?.copyWith(fullName: null)));
    return null;
  }

  bool isSaveDisabled() {
    // Return true when form has errors or is incomplete
    final hasErrors = state.errors?.hasError() ?? false;
    final isIncomplete = (state.employee?.isComplete() ?? false);
    return hasErrors || isIncomplete;
  }

  // MARK: - Date Picker Methods

  /// Common date picker logic used by both joining and final date pickers
  Future<DateTime?> _showDatePicker(BuildContext context) async {
    return await CustomDatePicker.show(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
      showAfter1WeekButton: true,
      showNoDateButton: true,
    );
  }

  Future<void> selectJoiningDate(BuildContext context) async {
    final selectedDate = await _showDatePicker(context);
    _debouncer.run(() {
      setEmployeeData(state.employee?.copyWith(joiningDate: selectedDate));
    });
  }

  Future<void> selectFinalDate(
    BuildContext context,
    AppLocalizations localization,
  ) async {
    final selectedDate = await _showDatePicker(context);

    // Validate joining date exists
    if (state.employee?.joiningDate == null) {
      _showErrorSnackBar(
        context: context,
        message: localization.finalDateCannotBeBeforeJoinDate,
      );
      _debouncer.run(() {
        setEmployeeData(state.employee?.copyWith(finalDate: null));
      });
      return;
    }

    // Validate final date is after joining date
    if (selectedDate != null &&
        state.employee?.joiningDate != null &&
        selectedDate.isBefore(state.employee!.joiningDate!)) {
      _showErrorSnackBar(
        context: context,
        message: localization.finalDateCannotBeBeforeJoinDate,
      );
      return;
    }

    _debouncer.run(() {
      setEmployeeData(state.employee?.copyWith(finalDate: selectedDate));
    });
  }

  // MARK: - Action Methods

  void handleCancel(BuildContext context, EmployeeModel? employee) {
    if (employee == null) {
      clearEmployeeForm();
    }

    if (context.canPop()) {
      context.pop();
    } else {
      context.pushReplacementNamed(DashboardScreen.name);
    }
  }

  Future<void> handleSave(
    BuildContext context,
    EmployeeModel? originalEmployee,
    AppLocalizations localization,
  ) async {
    if (formKey.currentState?.validate() ?? false) {
      emit(state.copyWith(status: CubitStatus.loading()));

      try {
        if (originalEmployee == null) {
          // Create new employee
          var newEmployee = state.employee?.copyWith(id: Uuid().v4()).toJson();
          newEmployee?['profession'] = state.employee?.profession?.toJson();
          if (newEmployee != null) {
            final employeeEntity = EmployeeEntity.fromJson(newEmployee);
            final result = await _repository.addEmployee(employeeEntity);

            result.fold(
              (failure) {
                emit(
                  state.copyWith(
                    status: CubitStatus.error(message: failure.message),
                  ),
                );
                _showErrorSnackBar(
                  context: context,
                  message: localization.errorSavingEmployee,
                );
              },
              (_) {
                emit(state.copyWith(status: CubitStatus.success()));
                fetchAllEmployees();
                _showSuccessSnackBar(
                  context: context,
                  message: localization.employeeAddedSuccessfully,
                );
                clearEmployeeForm();
                if (context.canPop()) context.pop();
              },
            );
          }
        } else {
          // Update existing employee
          var updatedEmployee =
              state.employee?.copyWith(id: originalEmployee.id).toJson();
          updatedEmployee?['profession'] = state.employee?.profession?.toJson();

          if (updatedEmployee != null) {
            final employeeEntity = EmployeeEntity.fromJson(updatedEmployee);
            final result = await _repository.updateEmployee(employeeEntity);

            result.fold(
              (failure) {
                emit(
                  state.copyWith(
                    status: CubitStatus.error(message: failure.message),
                  ),
                );
                _showErrorSnackBar(
                  context: context,
                  message: localization.errorUpdatingEmployee,
                );
              },
              (_) {
                emit(state.copyWith(status: CubitStatus.success()));
                fetchAllEmployees();
                _showSuccessSnackBar(
                  context: context,
                  message: localization.employeeUpdatedSuccessfully,
                );
                if (context.canPop()) context.pop();
              },
            );
          }
        }
      } catch (e) {
        emit(state.copyWith(status: CubitStatus.error(message: e.toString())));
        _showErrorSnackBar(
          context: context,
          message: localization.errorSavingEmployee,
        );
        debugPrint('Error saving employee: $e');
      }
    }
  }

  // MARK: - Helper Methods

  void _showErrorSnackBar({
    required BuildContext context,
    required String message,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: context.colorScheme.error,
      ),
    );
  }

  void _showSuccessSnackBar({
    required BuildContext context,
    required String message,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: context.colorScheme.primary,
      ),
    );
  }

  Future<void> deleteAllEmployees(
    BuildContext context,
    AppLocalizations localization,
  ) async {
    emit(state.copyWith(status: CubitStatus.loading()));

    final result = await _repository.deleteAllEmployees();

    result.fold(
      (failure) {
        emit(
          state.copyWith(status: CubitStatus.error(message: failure.message)),
        );
        _showErrorSnackBar(
          context: context,
          message: localization.errorDeletingEmployees,
        );
        debugPrint('Error deleting all employees: ${failure.message}');
      },
      (_) {
        emit(
          state.copyWith(
            status: CubitStatus.success(),
            employees: <EmployeeModel>[],
          ),
        );
        _showSuccessSnackBar(
          context: context,
          message: localization.allEmployeesDeletedSuccessfully,
        );
      },
    );
  }
}
