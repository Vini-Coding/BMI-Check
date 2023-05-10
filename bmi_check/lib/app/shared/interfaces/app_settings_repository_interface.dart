import 'package:bmi_check/app/mobile/settings/settings_height/enum/height_metrics_enum.dart';
import 'package:bmi_check/app/mobile/settings/settings_weight/enum/weight_metrics_enum.dart';
import 'package:bmi_check/app/shared/preferences/model/app_settings_model.dart';
import 'package:flutter/material.dart';

abstract class IAppSettingsRepository extends ChangeNotifier {
  AppSettingsModel get settings;

  Future<void> updateSettings({
    bool? isFirstEntry,
    HeightMetrics? heightMetricsSettings,
    WeightMetrics? weightMetricsSettings,
    Locale? languageSettings,
    ThemeMode? themeSettings,
  }); 
}
