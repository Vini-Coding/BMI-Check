import 'package:bmi_check/app/mobile/settings/settings_weight/enum/weight_metrics_enum.dart';
import 'package:flutter/material.dart';

class SettingsWeightController extends ValueNotifier {
  SettingsWeightController() : super(1);
  
  WeightMetrics get weightMetric {
    if (value == 1) {
      return WeightMetrics.pounds;
    } else {
      return WeightMetrics.kilograms;
    }
  }
}
