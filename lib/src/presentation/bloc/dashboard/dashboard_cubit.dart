import 'package:ems/src/core/base/base_cubit_wrapper.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/models/bottom_navbar/bottom_navbar_item_model.dart';

part 'dashboard_state.dart';
part 'dashboard_cubit.freezed.dart';

class DashboardCubit extends BaseCubitWrapper<DashboardState> {
  DashboardCubit() : super(initState) {
    _init();
  }

  static DashboardState get initState => DashboardState();

  _init() {
    emit(
      state.copyWith(
        items: [
          BottomNavbarItemModel(
            index: 0,
            title: 'Home',
            icon: 'assets/icons/home.svg',
            route: '/home',
            isSelected: true,
          ),
          BottomNavbarItemModel(
            index: 0,
            title: 'Employees',
            icon: 'assets/icons/users.svg',
            route: '/employees',
            isSelected: false,
          ),
          BottomNavbarItemModel(
            index: 1,
            title: 'Settings',
            icon: 'assets/icons/settings.svg',
            route: '/settings',
            isSelected: false,
          ),
        ],
      ),
    );
  }

  void setSelectedIndex(int index) {
    emit(state.copyWith(selectedIndex: index));
  }
}
