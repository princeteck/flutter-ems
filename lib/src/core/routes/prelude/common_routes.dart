import 'package:go_router/go_router.dart';

import '../../../presentation/ui/screens.dart';

final List<RouteBase> commonRoutes = <RouteBase>[
  GoRoute(
    path: SplashScreen.path,
    name: SplashScreen.name,
    builder: (context, state) => const SplashScreen(),
  ),
  GoRoute(
    path: DashboardScreen.path,
    name: DashboardScreen.name,
    builder: (context, state) => const DashboardScreen(),
  ),
  GoRoute(
    path: SettingsScreen.path,
    name: SettingsScreen.name,
    builder: (context, state) => const SettingsScreen(),
  ),
];
