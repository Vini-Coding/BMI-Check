import 'package:flutter/material.dart';

class ThemeController extends ValueNotifier<ThemeMode> {
  ThemeController() : super(ThemeMode.system);

  void toggleTheme(bool isDark) {
    isDark ? value = ThemeMode.dark : value = ThemeMode.light;
  }

  void getThemeSystem() {
    value = ThemeMode.system;
  }
}
