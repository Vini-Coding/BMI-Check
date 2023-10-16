import 'dart:ui';

import 'package:bmi_check/app/mobile/settings/settings_height/enum/height_metrics_enum.dart';
import 'package:bmi_check/app/mobile/settings/settings_weight/enum/weight_metrics_enum.dart';
import 'package:bmi_check/app/shared/interfaces/app_settings_repository_interface.dart';
import 'package:bmi_check/app/shared/preferences/model/app_settings_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSettingsRepository extends ChangeNotifier
    implements IAppSettingsRepository {
  AppSettingsRepository({required this.preferences});
  final SharedPreferences preferences;

  @override
  AppSettingsModel get settings {
    String? settingsJson = preferences.getString('appSettings');
    if (settingsJson != null) {
      return AppSettingsModel.fromJson(settingsJson);
    }
    return AppSettingsModel(
      isFirstEntry: true,
      heightMetricsSettings: HeightMetrics.feet,
      weightMetricsSettings: WeightMetrics.pounds,
      languageSettings: PlatformDispatcher.instance.locale,
      themeSettings: ThemeMode.system,
    );
  }

  @override
  Future<void> updateSettings({
    bool? isFirstEntry,
    HeightMetrics? heightMetricsSettings,
    WeightMetrics? weightMetricsSettings,
    Locale? languageSettings,
    ThemeMode? themeSettings,
  }) async {
    AppSettingsModel newSettings = settings.copyWith(
      isFirstEntry: isFirstEntry,
      heightMetricsSettings: heightMetricsSettings,
      weightMetricsSettings: weightMetricsSettings,
      languageSettings: languageSettings,
      themeSettings: themeSettings,
    );
    await preferences.setString(
      "appSettings",
      newSettings.toJson(),
    );
    notifyListeners();
  }
}
