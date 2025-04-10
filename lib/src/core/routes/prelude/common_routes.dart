import 'package:go_router/go_router.dart';

import '../../../presentation/ui/screens.dart';

final List<RouteBase> commonRoutes = <RouteBase>[
  GoRoute(
    path: SplashScreen.path,
    name: SplashScreen.name,
    builder: (context, state) => const SplashScreen(),
  ),
];
