import 'package:ems/src/l10n/app_localizations.dart';
import 'package:ems/src/presentation/bloc/employee/employee_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/di.dart';
import '../../../data/models/employee/employee_model.dart';
import '../../widgets/widgets.dart';
import 'components/components.dart';

class AddUpdateEmployeeScreen extends StatefulWidget {
  const AddUpdateEmployeeScreen({super.key, this.employee});
  static const String name = 'add_update_employee';
  static const String path = '/add_update_employee';
  final EmployeeModel? employee;

  @override
  State<AddUpdateEmployeeScreen> createState() =>
      _AddUpdateEmployeeScreenState();
}

class _AddUpdateEmployeeScreenState extends State<AddUpdateEmployeeScreen> {
  final _cubit = sl<EmployeeCubit>();
  AppLocalizations? _localization;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _localization = AppLocalizations.of(context);

    if (!_isInitialized) {
      _init();
      _isInitialized = true;
    }
  }

  void _init() {
    if (widget.employee != null) {
      _cubit.setEmployee(widget.employee);
    } else {
      _cubit.clearEmployeeForm();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EmployeeCubit, EmployeeState>(
      bloc: _cubit,
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBar(
            title: Text(
              widget.employee == null
                  ? _localization!.addEmployee
                  : _localization!.updateEmployee,
            ),
          ),
          bottomNavigationBar: EmployeeFormFooterSection(
            employee: widget.employee,
          ),
          body: EmployeeFormBodySection(employee: widget.employee),
        );
      },
    );
  }
}
