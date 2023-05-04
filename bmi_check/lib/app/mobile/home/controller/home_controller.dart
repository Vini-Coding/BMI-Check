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
  SettingsWeightController weightMetricsController =
      Injector.appInstance.get<SettingsWeightController>();

  double bmi = 0;
  double lowerIdealNumberWeightLimit = 0;
  double upperIdealNumberWeightLimit = 0;
  String lowerIdealWeightLimit = "";
  String upperIdealWeightLimit = "";

  void validate() {
    if (sexController.value == null) {
      throw UnselectedSexException();
    } else if (ageController.value! <= 0) {
      throw EmptyAgeException();
    } else if (weightController.value! <= 0) {
      throw EmptyWeightException();
    }
  }

  void bmiCalculate() {
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
        calculateIdealWeight(height);
        return;
      case HeightMetrics.inches:
        inchesToMeters();
        bmi = weight / (height * height);
        calculateIdealWeight(height);
        return;
      case HeightMetrics.meters:
        bmi = weight / (height * height);
        calculateIdealWeight(height);
        return;
      case HeightMetrics.centimeters:
        centimetersToMeters();
        bmi = weight / (height * height);
        calculateIdealWeight(height);
        return;
      default:
        bmi = weight / (height * height);
        calculateIdealWeight(height);
        return;
    }
  }

  void calculateIdealWeight(double height) {
    double kilogramsToPounds(double weightInKilograms) {
      double weightInPounds = weightInKilograms * 2.205;
      return weightInPounds;
    }

    switch (weightMetricsController.weightMetric) {
      case WeightMetrics.kilograms:
        lowerIdealNumberWeightLimit = 18.5 * (height * height);
        upperIdealNumberWeightLimit = 24.9 * (height * height);
        lowerIdealWeightLimit =
            lowerIdealNumberWeightLimit.toStringAsPrecision(2);
        upperIdealWeightLimit =
            "${upperIdealNumberWeightLimit.toStringAsPrecision(2)} kg";
        return;
      case WeightMetrics.pounds:
        lowerIdealNumberWeightLimit = 18.5 * (height * height);
        upperIdealNumberWeightLimit = 24.9 * (height * height);
        lowerIdealNumberWeightLimit =
            kilogramsToPounds(lowerIdealNumberWeightLimit);
        upperIdealNumberWeightLimit =
            kilogramsToPounds(upperIdealNumberWeightLimit);
        lowerIdealWeightLimit =
            lowerIdealNumberWeightLimit.toStringAsPrecision(2);
        upperIdealWeightLimit =
            "${upperIdealNumberWeightLimit.toStringAsPrecision(2)} lb";
        return;
      default:
        lowerIdealNumberWeightLimit = 18.5 * (height * height);
        upperIdealNumberWeightLimit = 24.9 * (height * height);
        lowerIdealWeightLimit =
            lowerIdealNumberWeightLimit.toStringAsPrecision(2);
        upperIdealWeightLimit =
            "${upperIdealNumberWeightLimit.toStringAsPrecision(2)} kg";

        return;
    }
  }
}
