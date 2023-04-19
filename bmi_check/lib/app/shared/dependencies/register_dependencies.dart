import 'package:bmi_check/app/mobile/settings/settings_height/controller/settings_height_controller.dart';
import 'package:bmi_check/app/mobile/settings/settings_language/controller/language_controller.dart';
import 'package:bmi_check/app/mobile/settings/settings_language/controller/settings_language_controller.dart';
import 'package:bmi_check/app/mobile/settings/settings_theme/settings_theme_controller.dart';
import 'package:bmi_check/app/mobile/settings/settings_weight/controller/settings_weight_controller.dart';
import 'package:bmi_check/app/shared/themes/theme_controller.dart';
import 'package:injector/injector.dart';

void registerDependencies() {
  Injector.appInstance.registerSingleton<ThemeController>(
    () => ThemeController(),
  );
  Injector.appInstance.registerSingleton<LanguageController>(
    () => LanguageController(),
  );
  Injector.appInstance.registerSingleton<SettingsHeightController>(
    () => SettingsHeightController(),
  );
  Injector.appInstance.registerSingleton<SettingsWeightController>(
    () => SettingsWeightController(),
  );
  Injector.appInstance.registerSingleton<SettingsLanguageController>(
    () => SettingsLanguageController(),
  );
  Injector.appInstance.registerSingleton<SettingsThemeController>(
    () => SettingsThemeController(),
  );
}
