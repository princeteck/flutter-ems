import 'package:ems/src/core/helpers/helpers.dart';
import 'package:ems/src/l10n/app_localizations.dart';
import 'package:ems/src/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uih/uih.dart';

import '../../../../core/di/di.dart';
import '../../../../core/helpers/debouncer.dart';
import '../../../../data/models/employee/employee_model.dart';
import '../../../bloc/employee/employee_cubit.dart';

class EmployeeFormBodySection extends StatelessWidget {
  const EmployeeFormBodySection({super.key, this.employee});
  final EmployeeModel? employee;

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    final cubit = sl<EmployeeCubit>();
    final Debouncer debouncer = Debouncer(
      delay: const Duration(milliseconds: 300),
    );
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
                                  icon: Icon(Icons.clear),
                                  onPressed: () {
                                    cubit.controllers[0].clear();
                                    cubit.setEmployee(
                                      state.employee?.copyWith(fullName: ''),
                                    );
                                  },
                                )
                                : null,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            cubit.updateState(
                              state.copyWith(
                                errors: state.errors?.copyWith(
                                  fullName:
                                      localization.pleaseEnterAValidFullName,
                                ),
                              ),
                            );
                            return localization.pleaseEnterAValidFullName;
                          }
                          cubit.updateState(
                            state.copyWith(
                              errors: state.errors?.copyWith(fullName: null),
                            ),
                          );
                          return null;
                        },
                        onChanged: (value) {
                          debouncer.run(() {
                            cubit.setEmployee(
                              state.employee?.copyWith(fullName: value),
                            );
                          });
                        },
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
                                  icon: Icon(Icons.clear),
                                  onPressed: () {
                                    cubit.controllers[1].clear();
                                    cubit.setEmployee(
                                      state.employee?.copyWith(email: ''),
                                    );
                                  },
                                )
                                : null,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            cubit.updateState(
                              state.copyWith(
                                errors: state.errors?.copyWith(
                                  email: localization.pleaseEnterAValidEmail,
                                ),
                              ),
                            );
                            return localization.pleaseEnterAValidEmail;
                          }
                          final emailRegExp = RegExp(
                            r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+',
                          );
                          if (!emailRegExp.hasMatch(value)) {
                            cubit.updateState(
                              state.copyWith(
                                errors: state.errors?.copyWith(
                                  email: localization.pleaseEnterAValidEmail,
                                ),
                              ),
                            );
                            return localization.pleaseEnterAValidEmail;
                          }
                          cubit.updateState(
                            state.copyWith(
                              errors: state.errors?.copyWith(email: null),
                            ),
                          );
                          return null;
                        },
                        onChanged: (value) {
                          debouncer.run(() {
                            cubit.setEmployee(
                              state.employee?.copyWith(email: value),
                            );
                          });
                        },
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
                                  var selectedDate =
                                      await CustomDatePicker.show(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(2000),
                                        lastDate: DateTime(2050),
                                        showAfter1WeekButton: true,
                                        showNoDateButton: true,
                                      );

                                  debouncer.run(() {
                                    cubit.setEmployee(
                                      state.employee?.copyWith(
                                        joiningDate: selectedDate,
                                      ),
                                    );
                                  });
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
                                  var selectedDate =
                                      await CustomDatePicker.show(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(2000),
                                        lastDate: DateTime(2050),
                                        showAfter1WeekButton: true,
                                        showNoDateButton: true,
                                      );

                                  if (state.employee?.joiningDate == null) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          localization
                                              .finalDateCannotBeBeforeJoinDate,
                                        ),
                                        backgroundColor:
                                            context.colorScheme.error,
                                      ),
                                    );
                                    debouncer.run(() {
                                      cubit.setEmployee(
                                        state.employee?.copyWith(
                                          finalDate: null,
                                        ),
                                      );
                                    });
                                    return;
                                  }

                                  if ((selectedDate != null &&
                                          state.employee?.joiningDate !=
                                              null) &&
                                      selectedDate.isBefore(
                                        state.employee!.joiningDate!,
                                      )) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          localization
                                              .finalDateCannotBeBeforeJoinDate,
                                        ),
                                        backgroundColor:
                                            context.colorScheme.error,
                                      ),
                                    );
                                    return;
                                  }
                                  if (selectedDate != null &&
                                      state.employee?.joiningDate != null &&
                                      selectedDate.isBefore(
                                        state.employee!.joiningDate!,
                                      )) {
                                    return;
                                  }
                                  debouncer.run(() {
                                    cubit.setEmployee(
                                      state.employee?.copyWith(
                                        finalDate: selectedDate,
                                      ),
                                    );
                                  });
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
