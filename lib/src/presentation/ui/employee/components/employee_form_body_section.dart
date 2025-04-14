import 'package:ems/src/core/base/cubit_status.dart';
import 'package:ems/src/core/helpers/helpers.dart';
import 'package:ems/src/l10n/app_localizations.dart';
import 'package:ems/src/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:uih/uih.dart';

import '../../../../core/di/di.dart';
import '../../../../data/models/employee/employee_model.dart';
import '../../../bloc/employee/employee_cubit.dart';
import '../../../bloc/profession/profession_cubit.dart';

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
                      padding: const EdgeInsets.only(bottom: 16),
                      child: BlocBuilder<ProfessionCubit, ProfessionState>(
                        bloc: sl<ProfessionCubit>(),
                        builder: (context, professionState) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                localization.profession,
                                style: context.textTheme.bodyMedium,
                              ),
                              SizedBox(height: 8),
                              GestureDetector(
                                onTap: () {
                                  _showProfessionBottomSheet(
                                    context,
                                    professionState,
                                    cubit,
                                    localization,
                                  );
                                },
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: context.colorScheme.outline,
                                    ),
                                    borderRadius: BorderRadius.circular(8.sp),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 12.sp,
                                    vertical: 14.sp,
                                  ),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(right: 8.sp),
                                        child: Icon(
                                          Icons.work_outline,
                                          color: context.colorScheme.primary,
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          state.employee?.profession?.name ??
                                              localization.selectProfession,
                                          style: context.textTheme.bodyMedium
                                              ?.copyWith(
                                                fontWeight: FontWeight.w500,
                                                color:
                                                    state
                                                                .employee
                                                                ?.profession
                                                                ?.name !=
                                                            null
                                                        ? context
                                                            .colorScheme
                                                            .onSurface
                                                        : context
                                                            .colorScheme
                                                            .outline,
                                              ),
                                        ),
                                      ),
                                      Icon(
                                        Icons.arrow_drop_down,
                                        color: context.colorScheme.primary,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
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

  void _showProfessionBottomSheet(
    BuildContext context,
    ProfessionState professionState,
    EmployeeCubit cubit,
    AppLocalizations localization,
  ) {
    // Ensure professions are loaded
    if (professionState.status != CubitStatus.success()) {
      sl<ProfessionCubit>().fetchProfessions();
    }

    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15.sp)),
      ),
      builder: (ctx) {
        return BlocBuilder<ProfessionCubit, ProfessionState>(
          bloc: sl<ProfessionCubit>(),
          builder: (ctx, state) {
            if (state.status == CubitStatus.loading()) {
              return Center(child: CircularProgressIndicator());
            } else if (state.professions?.isEmpty ?? false) {
              return Center(
                child: Padding(
                  padding: EdgeInsets.all(20.sp),
                  child: Text(localization.noProfessionsFound),
                ),
              );
            }

            return Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 16.sp,
                    horizontal: 16.sp,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        localization.selectProfession,
                        style: context.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.close_rounded, size: 16.sp),
                        onPressed: () => context.pop(),
                      ),
                    ],
                  ),
                ),
                Divider(height: 1),
                Flexible(
                  child: ListView.separated(
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(vertical: 8.sp),
                    itemCount: state.professions?.length ?? 0,
                    separatorBuilder: (_, __) => Divider(height: 1),
                    itemBuilder: (ctx, index) {
                      final profession = state.professions![index];
                      final isSelected =
                          cubit.state.employee?.profession?.id == profession.id;

                      return ListTile(
                        title: Text(profession.name ?? ''),
                        tileColor:
                            isSelected
                                ? context.colorScheme.primaryContainer
                                    .withAlpha(51)
                                : null,
                        trailing:
                            isSelected
                                ? Icon(
                                  Icons.check_circle,
                                  color: context.colorScheme.primary,
                                )
                                : null,
                        onTap: () {
                          // Update employee's profession
                          cubit.setEmployeeData(
                            cubit.state.employee?.copyWith(
                              profession: profession,
                            ),
                          );
                          context.pop();
                        },
                      );
                    },
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
