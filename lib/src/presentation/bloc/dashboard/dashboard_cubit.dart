import 'package:ems/src/core/base/base_cubit_wrapper.dart';
import 'package:ems/src/core/config/app_icons.dart';
import 'package:ems/src/presentation/ui/screens.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../core/services/navigation_service.dart';
import '../../../data/models/bottom_navbar/bottom_navbar_item_model.dart';
import '../../ui/dashboard/sections/employees_listing_section.dart';

part 'dashboard_state.dart';
part 'dashboard_cubit.freezed.dart';

@singleton
class DashboardCubit extends BaseCubitWrapper<DashboardState> {
  DashboardCubit() : super(initState) {
    _init();
  }

  static DashboardState get initState => DashboardState();

  _init() {
    setUpHomeBottomNavBarItems();
  }

  void setSelectedIndex(int index) {
    emit(state.copyWith(selectedIndex: index));
  }

  void setUpHomeBottomNavBarItems() {
    final items = [
      BottomNavbarItemModel(
        title: 'Home',
        icon: AppIcons.home,
        onTap: () {
          setSelectedIndex(0);
        },
      ),
      BottomNavbarItemModel(
        title: 'Employees',
        icon: AppIcons.users,
        widget: const EmployeesListingSection(),
        onTap: () {
          setSelectedIndex(1);
        },
      ),
      BottomNavbarItemModel(
        title: 'Menu',
        icon: AppIcons.bars3,
        onTap: () {
          injector<NavigationService>().pushNamed(SettingsScreen.name);
        },
      ),
    ];
    emit(state.copyWith(bottomNavBarItems: items));
  }
}
