import 'package:bmi_check/app/mobile/settings/settings_height/enum/height_metrics_enum.dart';
import 'package:flutter/material.dart';

class SettingsHeightController extends ValueNotifier<HeightMetrics>{
  SettingsHeightController(HeightMetrics initValue) : super(initValue);
  // HeightMetrics get heightMetric {
  //   switch (value) {
  //     case 1:
  //       return HeightMetrics.feet;
  //     case 2:
  //       return HeightMetrics.inches;
  //     case 3:
  //       return HeightMetrics.meters;
  //     case 4:
  //       return HeightMetrics.centimeters;
  //     default:
  //       return HeightMetrics.meters;
  //   }
  // }
}
