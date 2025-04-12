import 'package:ems/src/data/models/error/error_model.dart';
import 'package:ems/src/presentation/ui/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/di/di.dart';
import '../../../../data/models/employee/employee_model.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../bloc/employee/employee_cubit.dart';
import '../../../widgets/widgets.dart' show PrimaryBtnWidget, SecondBtnWidget;

class EmployeeFormFooterSection extends StatelessWidget {
  const EmployeeFormFooterSection({super.key, this.employee});
  final EmployeeModel? employee;

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context);
    final cubit = sl<EmployeeCubit>();
    return BlocBuilder<EmployeeCubit, EmployeeState>(
      bloc: cubit,
      builder: (context, state) {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.sp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SecondBtnWidget(
                  label: localization!.cancel,
                  margin: EdgeInsets.only(right: 12.sp),
                  onPressed: () {
                    if (employee == null) {
                      cubit.clearEmployeeForm();
                    }
                    if (context.canPop()) {
                      context.pop();
                    } else {
                      context.pushReplacementNamed(DashboardScreen.name);
                    }
                  },
                ),

                PrimaryBtnWidget(
                  label: localization.save,
                  isDisabled:
                      state.employee?.isComplete() ??
                      state.errors?.hasError() ??
                      true,
                  onPressed: () {
                    if (cubit.formKey.currentState?.validate() ?? false) {
                      if (employee == null) {
                        cubit.setEmployee(
                          state.employee?.copyWith(
                            id:
                                DateTime.now().millisecondsSinceEpoch
                                    .toString(),
                          ),
                        );
                      } else {
                        cubit.setEmployee(
                          state.employee?.copyWith(id: employee?.id),
                        );
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
