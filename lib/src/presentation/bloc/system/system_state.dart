part of 'system_cubit.dart';

@freezed
abstract class SystemState with _$SystemState {
  const factory SystemState({
    ThemeData? theme,
    String? appName,
    String? appVersion,
    String? appBuildNumber,
    @Default(ThemeMode.system) ThemeMode? themeMode,
    @Default(false) bool? isDarkMode,
  }) = _SystemState;
}
