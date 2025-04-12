import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  // Primary and accent colors
  static const Color _primaryLight = Color(0xFF1DA1F2); // Twitter blue
  static const Color _primaryDark = Color(
    0xFF1A91DA,
  ); // Slightly darker for dark theme
  static const Color _secondaryLight = Color(
    0xFF50B7F5,
  ); // Lighter shade of Twitter blue
  static const Color _secondaryDark = Color(
    0xFF7DCBFF,
  ); // Even lighter for dark theme

  // Define color schemes for light and dark themes
  static final ColorScheme _lightColorScheme = ColorScheme.light(
    primary: _primaryLight,
    onPrimary: Colors.white,
    primaryContainer: const Color(0xFFD1E4FF),
    onPrimaryContainer: const Color(0xFF001D36),
    primaryFixed: const Color(0xFFD1E4FF),
    primaryFixedDim: const Color(0xFFA4C8FF),
    onPrimaryFixed: const Color(0xFF001D36),
    onPrimaryFixedVariant: const Color(0xFF004A90),
    secondary: _secondaryLight,
    onSecondary: Colors.white,
    secondaryContainer: const Color(0xFFDDE5FF),
    onSecondaryContainer: const Color(0xFF001947),
    secondaryFixed: const Color(0xFFDDE5FF),
    secondaryFixedDim: const Color(0xFFB6C5FF),
    onSecondaryFixed: const Color(0xFF001947),
    onSecondaryFixedVariant: const Color(0xFF0031A6),
    tertiary: const Color(0xFF725B2E),
    onTertiary: Colors.white,
    tertiaryContainer: const Color(0xFFFFDEAD),
    onTertiaryContainer: const Color(0xFF281800),
    tertiaryFixed: const Color(0xFFFFDEAD),
    tertiaryFixedDim: const Color(0xFFE7C38C),
    onTertiaryFixed: const Color(0xFF281800),
    onTertiaryFixedVariant: const Color(0xFF554200),
    error: Colors.red[700]!,
    onError: Colors.white,
    errorContainer: const Color(0xFFFFDAD6),
    onErrorContainer: const Color(0xFF410002),
    surface: Colors.white,
    onSurface: Colors.black87,
    surfaceDim: const Color(0xFFDFE1F1),
    surfaceBright: const Color(0xFFFAFBFF),
    surfaceContainerLowest: const Color(0xFFFFFFFF),
    surfaceContainerLow: const Color(0xFFF3F5F9),
    surfaceContainer: const Color(0xFFEEF0F4),
    surfaceContainerHigh: const Color(0xFFE9EBF0),
    surfaceContainerHighest: const Color(0xFFE3E5EA),
    onSurfaceVariant: const Color(0xFF44474E),
    outline: const Color(0xFFDDDDE3), // Light grey for borders
    outlineVariant: const Color(0xFFC4C7C5),
    shadow: Colors.black.withAlpha(26), // 0.1 opacity (26/255)
    scrim: Colors.black.withAlpha(77), // 0.3 opacity (77/255)
    inverseSurface: const Color(0xFF303033),
    onInverseSurface: const Color(0xFFF3F2F7),
    inversePrimary: const Color(0xFF9ECAFF),
    surfaceTint: _primaryLight.withAlpha(13), // 0.05 opacity (13/255)
  );

  static final ColorScheme _darkColorScheme = ColorScheme.dark(
    primary: _primaryDark,
    onPrimary: Colors.white,
    primaryContainer: const Color(0xFF004A90),
    onPrimaryContainer: const Color(0xFFD1E4FF),
    primaryFixed: const Color(0xFFD1E4FF),
    primaryFixedDim: const Color(0xFFA4C8FF),
    onPrimaryFixed: const Color(0xFF001D36),
    onPrimaryFixedVariant: const Color(0xFF004A90),
    secondary: _secondaryDark,
    onSecondary: Colors.black,
    secondaryContainer: const Color(0xFF0031A6),
    onSecondaryContainer: const Color(0xFFDDE5FF),
    secondaryFixed: const Color(0xFFDDE5FF),
    secondaryFixedDim: const Color(0xFFB6C5FF),
    onSecondaryFixed: const Color(0xFF001947),
    onSecondaryFixedVariant: const Color(0xFF0031A6),
    tertiary: const Color(0xFFF0BD48),
    onTertiary: Colors.black,
    tertiaryContainer: const Color(0xFF554200),
    onTertiaryContainer: const Color(0xFFFFDEAD),
    tertiaryFixed: const Color(0xFFFFDEAD),
    tertiaryFixedDim: const Color(0xFFE7C38C),
    onTertiaryFixed: const Color(0xFF281800),
    onTertiaryFixedVariant: const Color(0xFF554200),
    error: Colors.red[400]!,
    onError: Colors.black,
    errorContainer: const Color(0xFF93000A),
    onErrorContainer: const Color(0xFFFFDAD6),
    surface: const Color(0xFF121212),
    onSurface: Colors.white,
    surfaceDim: const Color(0xFF131316),
    surfaceBright: const Color(0xFF38393C),
    surfaceContainerLowest: const Color(0xFF0D0E11),
    surfaceContainerLow: const Color(0xFF1A1B1E),
    surfaceContainer: const Color(0xFF1E1F22),
    surfaceContainerHigh: const Color(0xFF262729),
    surfaceContainerHighest: const Color(0xFF2F3033),
    onSurfaceVariant: const Color(0xFFC4C6CF),
    outline: const Color(0xFF44464F), // Darker grey for borders
    outlineVariant: const Color(0xFF444746),
    shadow: Colors.black.withAlpha(77), // 0.3 opacity (77/255)
    scrim: Colors.black.withAlpha(153), // 0.6 opacity (153/255)
    inverseSurface: const Color(0xFFE3E2E6),
    onInverseSurface: const Color(0xFF1A1B1E),
    inversePrimary: const Color(0xFF0062C3),
    surfaceTint: _primaryDark.withAlpha(26), // 0.1 opacity (26/255)
  );

  // Font settings
  static final _baseTextTheme = GoogleFonts.robotoTextTheme();

  // Common theme properties
  static ThemeData _buildTheme({
    required ColorScheme colorScheme,
    required Brightness brightness,
  }) {
    // Create a text theme with Material 3 typography styles
    final TextTheme textTheme = _baseTextTheme.copyWith(
      // Display styles
      displayLarge: _baseTextTheme.displayLarge?.copyWith(
        color: colorScheme.onSurface,
        fontSize: 57,
        fontWeight: FontWeight.w400,
        letterSpacing: -0.25,
      ),
      displayMedium: _baseTextTheme.displayMedium?.copyWith(
        color: colorScheme.onSurface,
        fontSize: 45,
        fontWeight: FontWeight.w400,
      ),
      displaySmall: _baseTextTheme.displaySmall?.copyWith(
        color: colorScheme.onSurface,
        fontSize: 36,
        fontWeight: FontWeight.w400,
      ),

      // Headline styles
      headlineLarge: _baseTextTheme.headlineLarge?.copyWith(
        color: colorScheme.onSurface,
        fontSize: 32,
        fontWeight: FontWeight.w400,
      ),
      headlineMedium: _baseTextTheme.headlineMedium?.copyWith(
        color: colorScheme.onSurface,
        fontSize: 28,
        fontWeight: FontWeight.w400,
      ),
      headlineSmall: _baseTextTheme.headlineSmall?.copyWith(
        color: colorScheme.onSurface,
        fontSize: 24,
        fontWeight: FontWeight.w400,
      ),

      // Title styles
      titleLarge: _baseTextTheme.titleLarge?.copyWith(
        color: colorScheme.onSurface,
        fontSize: 22,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15,
      ),
      titleMedium: _baseTextTheme.titleMedium?.copyWith(
        color: colorScheme.onSurface,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15,
      ),
      titleSmall: _baseTextTheme.titleSmall?.copyWith(
        color: colorScheme.onSurface,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
      ),

      // Body styles
      bodyLarge: _baseTextTheme.bodyLarge?.copyWith(
        color: colorScheme.onSurface,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
      ),
      bodyMedium: _baseTextTheme.bodyMedium?.copyWith(
        color: colorScheme.onSurface,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
      ),
      bodySmall: _baseTextTheme.bodySmall?.copyWith(
        color: colorScheme.onSurface.withAlpha(179), // 0.7 opacity
        fontSize: 12,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4,
      ),

      // Label styles
      labelLarge: _baseTextTheme.labelLarge?.copyWith(
        color: colorScheme.onSurface,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
      ),
      labelMedium: _baseTextTheme.labelMedium?.copyWith(
        color: colorScheme.onSurface,
        fontSize: 12,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.5,
      ),
      labelSmall: _baseTextTheme.labelSmall?.copyWith(
        color: colorScheme.onSurface,
        fontSize: 11,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.5,
      ),
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      brightness: brightness,
      // Typography
      textTheme: textTheme,
      // Floating action button theme
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        elevation: 4,
      ),
      // Card theme
      cardTheme: CardTheme(
        color: colorScheme.surface,
        shadowColor: colorScheme.shadow,
        elevation: 2,
        margin: const EdgeInsets.all(8),
      ),
      // Icon theme
      iconTheme: IconThemeData(color: colorScheme.onSurface, size: 24),
      // Button themes
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: colorScheme.onPrimary,
          backgroundColor: colorScheme.primary,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: colorScheme.primary),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: colorScheme.primary,
          side: BorderSide(color: colorScheme.primary),
        ),
      ),
      // Input decoration theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colorScheme.surface,
        labelStyle: TextStyle(
          color: colorScheme.onSurface.withAlpha(179),
        ), // 0.7 opacity
        hintStyle: TextStyle(
          color: colorScheme.onSurface.withAlpha(128),
        ), // 0.5 opacity
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: colorScheme.onSurface.withAlpha(51),
          ), // 0.2 opacity
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colorScheme.primary, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colorScheme.error, width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      // Divider theme
      dividerTheme: DividerThemeData(
        color: colorScheme.onSurface.withAlpha(26), // 0.1 opacity
        thickness: 1,
      ),
    );
  }

  // Exported theme getters
  static ThemeData get lightTheme =>
      _buildTheme(colorScheme: _lightColorScheme, brightness: Brightness.light);

  static ThemeData get darkTheme =>
      _buildTheme(colorScheme: _darkColorScheme, brightness: Brightness.dark);
}
