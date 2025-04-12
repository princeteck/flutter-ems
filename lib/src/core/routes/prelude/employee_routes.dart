import 'package:ems/src/data/models/employee/employee_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../presentation/ui/screens.dart';

final List<RouteBase> employeeRoutes = <RouteBase>[
  GoRoute(
    path: AddUpdateEmployeeScreen.path,
    name: AddUpdateEmployeeScreen.name,
    pageBuilder: (context, state) {
      final employee = state.extra as EmployeeModel?;
      return MaterialPage(child: AddUpdateEmployeeScreen(employee: employee));
    },
  ),
];
