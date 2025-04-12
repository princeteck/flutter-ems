import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  // Helper to get GoRouter instance
  GoRouter get _router => GoRouter.of(navigatorKey.currentContext!);

  Future<void> pushNamed(String routeName, {Object? arguments}) async {
    _router.pushNamed(routeName, extra: arguments);
  }

  Future<void> pushReplacementNamed(
    String routeName, {
    Object? arguments,
  }) async {
    _router.goNamed(routeName, extra: arguments);
  }

  void pop() {
    _router.pop();
  }

  void popUntil(String routeName) {
    _router.goNamed(routeName);
  }

  Future<void> pushNamedAndRemoveUntil(
    String routeName, {
    Object? arguments,
  }) async {
    _router.goNamed(routeName, extra: arguments);
  }
}
