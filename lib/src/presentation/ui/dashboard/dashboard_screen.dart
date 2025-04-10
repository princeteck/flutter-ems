import 'package:ems/src/core/di/di.dart';
import 'package:ems/src/presentation/bloc/dashboard/dashboard_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      bloc: sl<DashboardCubit>(),
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: BottomNavbarSection(
            items: state.items ?? [],
            selectedIndex: state.selectedIndex ?? 0,
            onTap: () {
              sl<DashboardCubit>().setSelectedIndex(0);
            },
          ),

          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [Text('Dashboard Screen')],
            ),
          ),
        );
      },
    );
  }
}
