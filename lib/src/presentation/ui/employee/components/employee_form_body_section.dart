import 'package:ems/src/core/helpers/helpers.dart';
import 'package:ems/src/l10n/app_localizations.dart';
import 'package:ems/src/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uih/uih.dart';

import '../../../../core/di/di.dart';
import '../../../../data/models/employee/employee_model.dart';
import '../../../bloc/employee/employee_cubit.dart';

class EmployeeFormBodySection extends StatelessWidget {
  const EmployeeFormBodySection({super.key, this.employee});
  final EmployeeModel? employee;

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    final cubit = sl<EmployeeCubit>();

    return BlocBuilder<EmployeeCubit, EmployeeState>(
      bloc: cubit,
      builder: (context, state) {
        return Form(
          key: cubit.formKey,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 16.h),

                    Padding(
                      padding: const EdgeInsets.only(bottom: 16, top: 8),
                      child: CustomInputField(
                        label: localization.fullName,
                        hint: localization.hintFullName,
                        initialValue: state.employee?.fullName ?? '',
                        keyboardType: TextInputType.name,
                        controller: cubit.controllers[0],
                        prefixIcon: Icon(
                          Icons.person_outline,
                          color: context.colorScheme.primary,
                        ),
                        suffixIcon:
                            (state.employee?.fullName?.isNotEmpty ?? false)
                                ? IconButton(
                                  icon: Icon(Icons.clear, size: 16.sp),
                                  onPressed: () => cubit.clearField('fullName'),
                                )
                                : null,
                        validator:
                            (value) =>
                                cubit.validateFullName(value, localization),
                        onChanged:
                            (value) => cubit.updateField('fullName', value),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: CustomInputField(
                        label: localization.emailAddress,
                        hint: localization.hintEmailAddress,
                        initialValue: state.employee?.email ?? '',
                        keyboardType: TextInputType.emailAddress,
                        controller: cubit.controllers[1],
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: context.colorScheme.primary,
                        ),
                        suffixIcon:
                            (state.employee?.email?.isNotEmpty ?? false)
                                ? IconButton(
                                  icon: Icon(Icons.clear, size: 16.sp),
                                  onPressed: () => cubit.clearField('email'),
                                )
                                : null,
                        validator:
                            (value) => cubit.validateEmail(value, localization),
                        onChanged: (value) => cubit.updateField('email', value),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                localization.joiningDate,
                                style: context.textTheme.bodyMedium,
                              ),
                              SizedBox(height: 8),
                              GestureDetector(
                                onTap: () async {
                                  await cubit.selectJoiningDate(context);
                                },
                                child: Container(
                                  width: 160.sp,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: context.colorScheme.outline,
                                    ),
                                    borderRadius: BorderRadius.circular(8.sp),
                                  ),
                                  padding: EdgeInsets.all(12.sp),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(right: 8.sp),
                                        child: Icon(
                                          state.employee?.joiningDate != null
                                              ? Icons.event
                                              : Icons.event_busy,
                                          color: context.colorScheme.primary,
                                        ),
                                      ),
                                      Text(
                                        (state.employee?.joiningDate != null
                                                ? Helper.dateTimeFormatter(
                                                  dateTime:
                                                      state
                                                          .employee
                                                          ?.joiningDate,
                                                  format: 'd MMM yyyy',
                                                  onlyDate: true,
                                                )
                                                : localization.noDate)
                                            .toString(),
                                        style: context.textTheme.bodySmall
                                            ?.copyWith(
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                localization.finalDate,
                                style: context.textTheme.bodyMedium,
                              ),
                              SizedBox(height: 8),
                              GestureDetector(
                                onTap: () async {
                                  await cubit.selectFinalDate(
                                    context,
                                    localization,
                                  );
                                },
                                child: Container(
                                  width: 160.sp,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: context.colorScheme.outline,
                                    ),
                                    borderRadius: BorderRadius.circular(8.sp),
                                  ),
                                  padding: EdgeInsets.all(12.sp),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(right: 8.sp),
                                        child: Icon(
                                          state.employee?.finalDate != null
                                              ? Icons.event
                                              : Icons.event_busy,
                                          color: context.colorScheme.primary,
                                        ),
                                      ),
                                      Text(
                                        (state.employee?.finalDate != null
                                                ? Helper.dateTimeFormatter(
                                                  dateTime:
                                                      state.employee?.finalDate,
                                                  format: 'd MMM yyyy',
                                                  onlyDate: true,
                                                )
                                                : localization.noDate)
                                            .toString(),
                                        style: context.textTheme.bodySmall
                                            ?.copyWith(
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
