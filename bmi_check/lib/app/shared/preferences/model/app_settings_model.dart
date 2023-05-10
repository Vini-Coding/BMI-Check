import 'dart:convert';
import 'package:bmi_check/app/mobile/settings/settings_height/enum/height_metrics_enum.dart';
import 'package:bmi_check/app/mobile/settings/settings_weight/enum/weight_metrics_enum.dart';
import 'package:bmi_check/app/shared/exceptions/unexpected_value_exception.dart';
import 'package:flutter/material.dart';

class AppSettingsModel {
  final bool isFirstEntry;
  final HeightMetrics heightMetricsSettings;
  final WeightMetrics weightMetricsSettings;
  final Locale languageSettings;
  final ThemeMode themeSettings;

  AppSettingsModel({
    required this.isFirstEntry,
    required this.heightMetricsSettings,
    required this.weightMetricsSettings,
    required this.languageSettings,
    required this.themeSettings,
  });

  AppSettingsModel copyWith({
    bool? isFirstEntry,
    HeightMetrics? heightMetricsSettings,
    WeightMetrics? weightMetricsSettings,
    Locale? languageSettings,
    ThemeMode? themeSettings,
  }) {
    return AppSettingsModel(
      isFirstEntry: isFirstEntry ?? this.isFirstEntry,
      heightMetricsSettings:
          heightMetricsSettings ?? this.heightMetricsSettings,
      weightMetricsSettings:
          weightMetricsSettings ?? this.weightMetricsSettings,
      languageSettings: languageSettings ?? this.languageSettings,
      themeSettings: themeSettings ?? this.themeSettings,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'isFirstEntry': isFirstEntry,
      'heightMetricsSettings': heightMetricsSettings.name,
      'weightMetricsSettings': weightMetricsSettings.name,
      'languageSettings': languageSettings.languageCode,
      'themeSettings': themeSettings.name,
    };
  }

  factory AppSettingsModel.fromMap(Map<String, dynamic> map) {
    HeightMetrics heightMetrics;
    switch (map['heightMetricsSettings']) {
      case "feet":
        heightMetrics = HeightMetrics.feet;
        break;
      case "inches":
        heightMetrics = HeightMetrics.inches;
        break;
      case "meters":
        heightMetrics = HeightMetrics.meters;
        break;
      case "centimeters":
        heightMetrics = HeightMetrics.centimeters;
        break;
      default:
        throw UnexpectedValueException();
    }
    WeightMetrics weightMetrics;
    switch (map['weightMetricsSettings']) {
      case "pounds":
        weightMetrics = WeightMetrics.pounds;
        break;
      case "kilograms":
        weightMetrics = WeightMetrics.kilograms;
        break;
      default:
        throw UnexpectedValueException();
    }
    Locale languageSettings;
    switch (map['languageSettings']) {
      case 'WidgetsBinding.instance.window.locale':
        languageSettings = WidgetsBinding.instance.window.locale;
        break;
      case 'zh':
        languageSettings = const Locale('zh');
        break;
      case 'de':
        languageSettings = const Locale('de');
        break;
      case 'es':
        languageSettings = const Locale('es');
        break;
      case 'en':
        languageSettings = const Locale('en');
        break;
      case 'fr':
        languageSettings = const Locale('fr');
        break;
      case 'hi':
        languageSettings = const Locale('hi');
        break;
      case 'it':
        languageSettings = const Locale('it');
        break;
      case 'ja':
        languageSettings = const Locale('ja');
        break;
      case 'pt':
        languageSettings = const Locale('pt');
        break;
      case 'ru':
        languageSettings = const Locale('ru');
        break;
      default:
        throw UnexpectedValueException();
    }
    ThemeMode themeSettings;
    switch (map['themeSettings']) {
      case "system":
        themeSettings = ThemeMode.system;
        break;
      case "light":
        themeSettings = ThemeMode.light;
        break;
      case "dark":
        themeSettings = ThemeMode.dark;
        break;
      default:
        throw UnexpectedValueException();
    }
    return AppSettingsModel(
      isFirstEntry: map['isFirstEntry'] as bool,
      heightMetricsSettings: heightMetrics,
      weightMetricsSettings: weightMetrics,
      languageSettings: languageSettings,
      themeSettings: themeSettings,
    );
  }

  String toJson() => json.encode(toMap());

  factory AppSettingsModel.fromJson(String source) =>
      AppSettingsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AppSettings(isFirstEntry: $isFirstEntry, heightMetricsSettings: $heightMetricsSettings, weightMetricsSettings: $weightMetricsSettings, languageSettings: $languageSettings, themeSettings: $themeSettings)';
  }
}
