import 'package:ems/src/core/di/di.dart';
import 'package:ems/src/presentation/ui/screens.dart';
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../services/navigation_service.dart';
import 'prelude/prelude.dart';

class AppRouter {
  static final GoRouter _router = GoRouter(
    initialLocation: SplashScreen.path,
    routes: <RouteBase>[
      ...authRoutes,
      ...commonRoutes,
      ...professionRoutes,
      ...employeeRoutes,
    ],
    redirect: (context, state) {
      if (kDebugMode) debugPrint('Redirecting to /');
      return state.name;
    },
    errorBuilder: (context, state) {
      return const Scaffold(body: Center(child: Text('Error')));
    },
    // navigatorKey: ,
    observers: <NavigatorObserver>[],
    navigatorKey: sl<NavigationService>().navigatorKey,
  );

  static GoRouter get router => _router;
}
