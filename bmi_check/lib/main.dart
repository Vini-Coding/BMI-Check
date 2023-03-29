import 'package:bmi_check/app/bmi_check_app.dart';
import 'package:flutter/material.dart';
import 'package:injector/injector.dart';
import 'app/shared/themes/theme_controller.dart';

void main() {
  registerDependencies();
  runApp(const BmiCheckApp());
}

void registerDependencies() {
  Injector.appInstance.registerSingleton<ThemeController>(
    () => ThemeController(),
  );
}
