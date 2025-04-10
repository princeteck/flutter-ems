import 'package:flutter/material.dart' show ThemeData;

class AppTheme {
  AppTheme._();
  static final _lightTheme = ThemeData.light(useMaterial3: true);
  static final _darkTheme = ThemeData.dark(useMaterial3: true);

  static ThemeData get lightTheme => _lightTheme.copyWith();
  static ThemeData get darkTheme => _darkTheme.copyWith();
}
