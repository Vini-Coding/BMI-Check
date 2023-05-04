import 'package:bmi_check/app/shared/themes/dark/dark_color_scheme.dart';
import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: darkColorScheme,
  brightness: Brightness.dark,
  primaryColor: darkColorScheme.primary,
  scaffoldBackgroundColor: darkColorScheme.background,
  textTheme: TextTheme(
    displayLarge: TextStyle(
      fontSize: 40,
      fontFamily: 'PatuaOne',
      color: darkColorScheme.outline,
    ),
    displayMedium: TextStyle(
      fontSize: 120,
      fontFamily: 'PatuaOne',
      color: darkColorScheme.primary,
    ),
    displaySmall: TextStyle(
      fontSize: 18,
      fontFamily: 'PatuaOne',
      color: darkColorScheme.primary,
    ),
    bodyLarge: TextStyle(
      fontSize: 20,
      fontFamily: 'Varela Round',
      color: darkColorScheme.outline,
    ),
    bodyMedium: TextStyle(
      fontSize: 18,
      fontFamily: 'Varela Round',
      color: darkColorScheme.outline,
    ),
    labelSmall: TextStyle(
      fontSize: 18,
      fontFamily: 'Varela Round',
      fontWeight: FontWeight.w500,
      color: darkColorScheme.primary,
    ),
    labelMedium: TextStyle(
      fontFamily: 'PatuaOne',
      fontSize: 28,
      color: darkColorScheme.outline,
    ),
  ),
  iconTheme: IconThemeData(
    color: darkColorScheme.outline,
    size: 22,
  ),
  sliderTheme: SliderThemeData(
    activeTickMarkColor: darkColorScheme.primary,
    activeTrackColor: darkColorScheme.primary,
    inactiveTickMarkColor: darkColorScheme.onSurfaceVariant,
    inactiveTrackColor: darkColorScheme.onSurfaceVariant,
  ),
  radioTheme: RadioThemeData(
    fillColor: MaterialStateProperty.all(darkColorScheme.outline),
  )
);
