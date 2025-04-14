import 'package:ems/src/core/helpers/helpers.dart';
import 'package:ems/src/presentation/bloc/employee/employee_cubit.dart';
import 'package:ems/src/presentation/bloc/profession/profession_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uih/uih.dart';

import '../../../../core/di/di.dart';

class HomeSection extends StatefulWidget {
  const HomeSection({super.key});

  @override
  State<HomeSection> createState() => _HomeSectionState();
}

class _HomeSectionState extends State<HomeSection> {
  @override
  void initState() {
    _init();
    super.initState();
  }

  void _init() {
    sl<EmployeeCubit>().fetchAllEmployees();
    sl<ProfessionCubit>().fetchProfessions();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello User,',
                    style: context.textTheme.displaySmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 4.sp),
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today,
                        size: 16.sp,
                        color: context.colorScheme.onSurfaceVariant,
                      ),
                      SizedBox(width: 4.sp),
                      Text(
                        Helper.dateTimeFormatter(
                          dateTime: DateTime.now(),
                          format: 'E, dd MMM yyyy',
                        ),
                        style: context.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w400,
                          color: context.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.sp),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BlocBuilder<EmployeeCubit, EmployeeState>(
                        bloc: sl<EmployeeCubit>(),
                        builder: (context, state) {
                          return StatItemWidget(
                            label: 'Employees',
                            count: Helper.beautifyInt((state.employeesCount)),
                            gradient: LinearGradient(
                              transform: const GradientRotation(180),
                              colors: [
                                context.colorScheme.primaryContainer,
                                context.colorScheme.onPrimaryContainer,
                              ],
                            ),
                          );
                        },
                      ),
                      BlocBuilder<ProfessionCubit, ProfessionState>(
                        bloc: sl<ProfessionCubit>(),
                        builder: (context, state) {
                          return StatItemWidget(
                            label: 'Professions',
                            count: Helper.beautifyInt((state.professionCount)),
                            gradient: LinearGradient(
                              transform: const GradientRotation(180),
                              colors: [
                                context.colorScheme.tertiaryContainer,
                                context.colorScheme.onTertiaryContainer,
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StatItemWidget extends StatelessWidget {
  const StatItemWidget({
    super.key,
    required this.count,
    required this.label,
    this.gradient,
  });
  final String label;
  final String count;
  final Gradient? gradient;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.widthPx * 0.44,
      height: 100.sp,
      decoration: BoxDecoration(
        color: gradient != null ? null : context.colorScheme.primary,
        gradient: gradient,
        borderRadius: BorderRadius.circular(8.sp),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 10,
            left: 10,
            child: Text(
              label,
              style: context.textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w900,
                color: context.colorScheme.onPrimary,
              ),
            ),
          ),
          Positioned(
            bottom: -25,
            right: -12,
            child: Transform.rotate(
              angle: -0.2,
              child: Text(
                count.toString(),
                style: context.textTheme.displayLarge?.copyWith(
                  fontWeight: FontWeight.w900,
                  fontSize: 86.sp,
                  color: context.colorScheme.onPrimary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
