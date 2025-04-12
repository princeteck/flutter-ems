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

import '../../../core/base/cubit_status.dart';
import '../../../data/models/employee/employee_model.dart';
import '../../../data/models/error/error_model.dart';
import '../../widgets/widgets.dart';

part 'employee_state.dart';
part 'employee_cubit.freezed.dart';

@singleton
class EmployeeCubit extends BaseCubitWrapper<EmployeeState> {
  EmployeeCubit() : super(initState) {
    _init();
  }

  void _init() {
    controllers = List.generate(2, (index) => TextEditingController());
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late List<TextEditingController> controllers;
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
    final isIncomplete = !(state.employee?.isComplete() ?? false);
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

  void handleSave(EmployeeModel? originalEmployee) {
    if (formKey.currentState?.validate() ?? false) {
      try {
        if (originalEmployee == null) {
          // Create new employee
          final newEmployee = state.employee?.copyWith(
            id: DateTime.now().millisecondsSinceEpoch.toString(),
          );
          setEmployeeData(newEmployee);
          // Here you would typically call a repository method to save the employee
        } else {
          // Update existing employee
          final updatedEmployee = state.employee?.copyWith(
            id: originalEmployee.id,
          );
          setEmployeeData(updatedEmployee);
          // Here you would typically call a repository method to update the employee
        }
      } catch (e) {
        // Handle any errors that occur during save
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
}
