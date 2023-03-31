import 'package:bmi_check/app/shared/themes/theme_controller.dart';
import 'package:injector/injector.dart';

void registerDependencies() {
  Injector.appInstance.registerSingleton<ThemeController>(
    () => ThemeController(),
  );
}