import 'package:bmi_check/app/mobile/settings/settings_language/controller/settings_language_controller.dart';
import 'package:bmi_check/app/shared/themes/theme_controller.dart';
import 'package:injector/injector.dart';

void registerDependencies() {
  Injector.appInstance.registerSingleton<ThemeController>(
    () => ThemeController(),
  );
  Injector.appInstance.registerSingleton<SettingsLanguageController>(
    () => SettingsLanguageController(),
  );
}