import 'package:ems/src/core/di/di.dart';
import 'package:ems/src/presentation/bloc/dashboard/dashboard_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'components/bottom_navbar_section.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});
  static const String name = 'dashboard';
  static const String path = '/dashboard';

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      bloc: sl<DashboardCubit>(),
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 120.sp, minHeight: 100.sp),
            child: SafeArea(
              child: BottomNavbarSection(
                items: state.bottomNavBarItems ?? [],
                selectedIndex: state.selectedIndex ?? 0,
                onTap: (index) {
                  sl<DashboardCubit>().setSelectedIndex(index);
                },
              ),
            ),
          ),

          body: AnimatedSwitcher(
            duration: const Duration(milliseconds: 100),
            child:
                state.bottomNavBarItems?[state.selectedIndex ?? 0].widget ??
                const Center(child: Text('No widget found')),
          ),
        );
      },
    );
  }
}
