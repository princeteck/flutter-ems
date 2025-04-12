import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../data/models/profession/profession_model.dart';
import '../../../presentation/ui/screens.dart';

final List<RouteBase> professionRoutes = <RouteBase>[
  GoRoute(
    path: ProfessionsListingScreen.path,
    name: ProfessionsListingScreen.name,
    builder: (context, state) => const ProfessionsListingScreen(),
  ),
  GoRoute(
    path: AddUpdateProfessionScreen.path,
    name: AddUpdateProfessionScreen.name,
    pageBuilder: (context, state) {
      final profession = state.extra as ProfessionModel?;
      return MaterialPage(
        child: AddUpdateProfessionScreen(profession: profession),
      );
    },
  ),
];
