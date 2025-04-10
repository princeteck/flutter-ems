import 'package:ems/src/core/config/app_theme.dart';
import 'package:ems/src/presentation/bloc/system/system_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/di/di.dart' show sl;
import 'core/routes/app_routes.dart';
import 'l10n/app_localizations.dart';

class EmsApp extends StatefulWidget {
  const EmsApp({super.key});

  @override
  State<EmsApp> createState() => _EmsAppState();
}

class _EmsAppState extends State<EmsApp> {
  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  Future<void> _initializeApp() async {}

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SystemCubit, SystemState>(
      bloc: sl<SystemCubit>()..initialize,
      listener: (context, state) {},
      builder: (context, state) {
        return ScreenUtilInit(
          designSize: const Size(375, 812),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (_, child) {
            return MaterialApp.router(
              routerConfig: AppRouter.router,
              debugShowCheckedModeBanner: false,
              title: 'E.M.S',
              builder: (context, child) {
                return child!;
              },
              locale: const Locale('en'),
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              themeMode: state.themeMode,
            );
          },
        );
      },
    );
  }
}
