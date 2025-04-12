part of 'dashboard_cubit.dart';

@freezed
abstract class DashboardState with _$DashboardState {
  const factory DashboardState({
    @Default(0) int? selectedIndex,
    List<BottomNavbarItemModel>? bottomNavBarItems,
  }) = _DashboardState;
}
