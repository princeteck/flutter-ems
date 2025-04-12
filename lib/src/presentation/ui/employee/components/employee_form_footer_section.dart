import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                  onPressed: () => cubit.handleCancel(context, employee),
                ),

                PrimaryBtnWidget(
                  label: localization.save,
                  isDisabled: cubit.isSaveDisabled(),
                  onPressed: () => cubit.handleSave(employee),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
