import 'package:go_router/go_router.dart';

import '../../../presentation/ui/screens.dart';

final List<RouteBase> authRoutes = <RouteBase>[
  GoRoute(
    path: LoginScreen.path,
    name: LoginScreen.name,
    builder: (context, state) => const LoginScreen(),
  ),
  GoRoute(
    path: RegisterScreen.path,
    name: RegisterScreen.name,
    builder: (context, state) => const RegisterScreen(),
  ),
];
