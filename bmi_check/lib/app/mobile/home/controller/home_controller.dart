import 'package:bmi_check/app/mobile/home/components/age/age_controller.dart';
import 'package:bmi_check/app/mobile/home/components/height/height_selection_controller.dart';
import 'package:bmi_check/app/mobile/home/components/sex/sex_selection_widget_controller.dart';
import 'package:bmi_check/app/mobile/home/components/weight/weight_controller.dart';
import 'package:bmi_check/app/mobile/home/exceptions/empty_age_exception.dart';
import 'package:bmi_check/app/mobile/home/exceptions/empty_weight_exception.dart';
import 'package:bmi_check/app/mobile/home/exceptions/unselected_sex_exception.dart';
import 'package:bmi_check/app/mobile/settings/settings_height/controller/settings_height_controller.dart';
import 'package:bmi_check/app/mobile/settings/settings_height/enum/height_metrics_enum.dart';
import 'package:bmi_check/app/mobile/settings/settings_weight/controller/settings_weight_controller.dart';
import 'package:bmi_check/app/mobile/settings/settings_weight/enum/weight_metrics_enum.dart';
import 'package:flutter/material.dart';
import 'package:injector/injector.dart';

class HomeController extends ChangeNotifier {
  SexSelected sexController = Injector.appInstance.get<SexSelected>();
  AgeController ageController = Injector.appInstance.get<AgeController>();
  HeightSelectionController heightController =
      Injector.appInstance.get<HeightSelectionController>();
  WeightController weightController =
      Injector.appInstance.get<WeightController>();
  SettingsHeightController heightMetricsController =
      Injector.appInstance.get<SettingsHeightController>();
  SettingsWeightController weightMetricsController = Injector.appInstance.get<SettingsWeightController>();

  double bmi = 0;

  void validate() {
    if (sexController.value == null) {
      throw UnselectedSexException();
    } else if (ageController.value! <= 0) {
      throw EmptyAgeException();
    } else if (weightController.value! <= 0) {
      throw EmptyWeightException();
    }
  }

  void calculate() {
    double height = heightController.value!;
    double weight = weightController.value!;

    //Weight Convertions
    void poundsToKilograms() {
      weight = weight * 0.45359237;
    }

    //HeightConvertions
    void feetsToMeters() {
      height = height / 3.281;
    }

    void centimetersToMeters() {
      height = height / 100;
    }

    void inchesToMeters() {
      height = height * 0.0254;
    }

    if (weightMetricsController.weightMetric == WeightMetrics.pounds) {
      poundsToKilograms();
    }

    switch (heightMetricsController.heightMetric) {
      case HeightMetrics.feet:
        feetsToMeters();
        bmi = weight / (height * height);
        return;
      case HeightMetrics.inches:
        inchesToMeters();
        bmi = weight / (height * height);
        return;
      case HeightMetrics.meters:
        bmi = weight / (height * height);
        return;
      case HeightMetrics.centimeters:
        centimetersToMeters();
        bmi = weight / (height * height);
        return;
      default:
        bmi = weight / (height * height);
        return;
    }
  }
}
