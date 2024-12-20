import 'package:flutter/material.dart';

/// Provides [ThemeData] for the Apple ML Integration Demo app.
class AppleMLIntegrationAppTheme {
  /// Returns dark theme data for the Apple ML Integration Demo app.
  static ThemeData themeData = ThemeData(
    primaryColor: Colors.black,
    primaryColorDark: Colors.black,
    primaryColorLight: Colors.white,
    scaffoldBackgroundColor: Colors.white54,
    useMaterial3: true,
    fontFamily: 'Chicago',
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: BorderSide(
          width: 2.0,
        ),
        borderRadius: BorderRadius.zero,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 2.0,
        ),
        borderRadius: BorderRadius.zero,
      ),
      filled: true,
      fillColor: Colors.black12,
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Colors.black,
      selectionColor: Colors.black26,
      selectionHandleColor: Colors.black,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shadowColor: Colors.black,
        elevation: 0.0,
        shape: const RoundedRectangleBorder(
          side: BorderSide(),
        ),
        backgroundColor: Colors.white,
        overlayColor: Colors.transparent,
      ),
    ),
  );
}
