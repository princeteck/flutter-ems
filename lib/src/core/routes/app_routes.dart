import 'package:ems/src/presentation/ui/screens.dart';
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'prelude/prelude.dart';

class AppRouter {
  static final GoRouter _router = GoRouter(
    initialLocation: SplashScreen.path,
    routes: <RouteBase>[...commonRoutes],
    redirect: (context, state) {
      if (kDebugMode) debugPrint('Redirecting to /');
      return state.name;
    },
    errorBuilder: (context, state) {
      return const Scaffold(body: Center(child: Text('Error')));
    },
    // navigatorKey: ,
    observers: <NavigatorObserver>[],
  );

  static GoRouter get router => _router;
}
