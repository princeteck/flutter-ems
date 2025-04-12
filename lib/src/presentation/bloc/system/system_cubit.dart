import 'package:ems/src/core/base/base_cubit_wrapper.dart';
import 'package:ems/src/core/config/app_theme.dart';
import 'package:ems/src/core/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'system_state.dart';
part 'system_cubit.freezed.dart';

@singleton
class SystemCubit extends BaseCubitWrapper<SystemState> {
  SystemCubit() : super(initialState) {
    _init();
  }

  static SystemState get initialState => const SystemState();

  void _init() {
    Future.microtask(() {
      getAppName();
      getAppVersion();
      getAppBuildNumber();
    });
  }

  void getAppName() {
    Helper.getAppName().then((value) {
      emit(state.copyWith(appName: value));
    });
  }

  void getAppVersion() {
    Helper.getAppVersion().then((value) {
      emit(state.copyWith(appVersion: value));
    });
  }

  void getAppBuildNumber() {
    Helper.getAppBuildNumber().then((value) {
      emit(state.copyWith(appBuildNumber: value));
    });
  }

  void setTheme(ThemeData theme) {
    emit(
      state.copyWith(
        theme: theme,
        isDarkMode: theme.brightness == Brightness.dark,
      ),
    );
  }

  void setThemeMode(ThemeMode themeMode) {
    emit(
      state.copyWith(
        themeMode: themeMode,
        isDarkMode: themeMode == ThemeMode.dark,
      ),
    );
  }

  void initialize({required BuildContext context}) async {
    var brightness = MediaQuery.of(context).platformBrightness;
    if (state.themeMode == ThemeMode.system) {
      if (brightness == Brightness.light) {
        emit(state.copyWith(theme: AppTheme.lightTheme));
      } else {
        emit(state.copyWith(theme: AppTheme.darkTheme));
      }
    } else {
      emit(state.copyWith(theme: AppTheme.darkTheme));
    }
  }
}
