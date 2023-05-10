import 'package:bmi_check/app/mobile/home/components/age/age_controller.dart';
import 'package:bmi_check/app/mobile/home/components/height/height_selection_controller.dart';
import 'package:bmi_check/app/mobile/home/components/sex/sex_selection_widget_controller.dart';
import 'package:bmi_check/app/mobile/home/components/weight/weight_controller.dart';
import 'package:bmi_check/app/mobile/settings/settings_height/controller/settings_height_controller.dart';
import 'package:bmi_check/app/mobile/settings/settings_language/controller/language_controller.dart';
import 'package:bmi_check/app/mobile/settings/settings_language/controller/settings_language_controller.dart';
import 'package:bmi_check/app/mobile/settings/settings_theme/settings_theme_controller.dart';
import 'package:bmi_check/app/mobile/settings/settings_weight/controller/settings_weight_controller.dart';
import 'package:bmi_check/app/shared/interfaces/app_settings_repository_interface.dart';
import 'package:bmi_check/app/shared/preferences/repository/app_settings_repository.dart';
import 'package:bmi_check/app/shared/themes/theme_controller.dart';
import 'package:injector/injector.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> registerDependencies() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  Injector.appInstance.registerSingleton<IAppSettingsRepository>(
    () => AppSettingsRepository(preferences: sharedPreferences),
  );

  IAppSettingsRepository settingsRepository =
      Injector.appInstance.get<IAppSettingsRepository>();

  Injector.appInstance.registerSingleton<ThemeController>(
    () => ThemeController(settingsRepository.settings.themeSettings),
  );

  Injector.appInstance.registerSingleton<LanguageController>(
    () => LanguageController(settingsRepository.settings.languageSettings),
  );

  Injector.appInstance.registerSingleton<SettingsHeightController>(
    () => SettingsHeightController(
      settingsRepository.settings.heightMetricsSettings,
    ),
  );

  Injector.appInstance.registerSingleton<SettingsWeightController>(
    () => SettingsWeightController(
      settingsRepository.settings.weightMetricsSettings,
    ),
  );

  Injector.appInstance.registerSingleton<SettingsLanguageController>(
    () => SettingsLanguageController(
      settingsRepository.settings.languageSettings,
    ),
  );

  Injector.appInstance.registerSingleton<SettingsThemeController>(
    () => SettingsThemeController(
      settingsRepository.settings.themeSettings,
    ),
  );

  Injector.appInstance.registerSingleton<WeightController>(
    () => WeightController(),
  );

  Injector.appInstance.registerSingleton<HeightSelectionController>(
    () => HeightSelectionController(),
  );

  Injector.appInstance.registerSingleton<AgeController>(
    () => AgeController(),
  );

  Injector.appInstance.registerSingleton<SexSelected>(
    () => SexSelected(),
  );
}
