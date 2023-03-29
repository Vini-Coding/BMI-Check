import 'package:bmi_check/app/shared/themes/light/light_color_scheme.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: lightColorScheme,
  brightness: Brightness.light,
  primaryColor: lightColorScheme.primary,
  scaffoldBackgroundColor: lightColorScheme.background,
  textTheme: TextTheme(
    displayLarge: TextStyle(
      fontSize: 40,
      fontFamily: 'PatuaOne',
      color: lightColorScheme.outline,
    ),
    displayMedium: TextStyle(
      fontSize: 22,
      fontFamily: 'PatuaOne',
      color: lightColorScheme.outline,
    ),
    bodyLarge: TextStyle(
      fontSize: 20,
      fontFamily: 'Varela Round',
      color: lightColorScheme.outline,
    ),
    bodyMedium: TextStyle(
      fontSize: 18,
      fontFamily: 'Varela Round',
      color: lightColorScheme.outline,
    ),
    labelSmall: TextStyle(
      fontSize: 18,
      fontFamily: 'Varela Round',
      fontWeight: FontWeight.w500,
      color: lightColorScheme.primary,
    ),
    labelMedium: TextStyle(
      fontFamily: 'PatuaOne',
      fontSize: 28, 
      color: lightColorScheme.background,
    ),
  ),
  iconTheme: IconThemeData(
    color: lightColorScheme.outline,
    size: 22,
  ),
  sliderTheme: SliderThemeData(
    activeTickMarkColor: lightColorScheme.primary,
    activeTrackColor: lightColorScheme.primary,
    inactiveTickMarkColor: lightColorScheme.outline,
    inactiveTrackColor: lightColorScheme.outline,
  ),
  
);
