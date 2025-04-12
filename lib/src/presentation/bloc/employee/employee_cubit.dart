import 'package:ems/src/core/base/base_cubit_wrapper.dart';
import 'package:flutter/material.dart' show FormState, GlobalKey;
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../core/base/cubit_status.dart';
import '../../../data/models/employee/employee_model.dart';
import '../../../data/models/error/error_model.dart';

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

  static EmployeeState get initState => EmployeeState(
    status: CubitStatus.initial(),
    employee: EmployeeModel(),
    employees: <EmployeeModel>[],
    errors: ErrorModel(),
  );

  void updateState(EmployeeState newState) {
    emit(newState);
  }

  void setEmployee(EmployeeModel? employee) {
    emit(state.copyWith(employee: employee));
  }

  void clearEmployeeForm() {
    for (var controller in controllers) {
      controller.clear();
    }
    formKey.currentState?.reset();
    emit(state.copyWith(employee: EmployeeModel()));
  }
}
