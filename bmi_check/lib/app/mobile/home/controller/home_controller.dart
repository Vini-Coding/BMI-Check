import 'package:bmi_check/app/mobile/home/components/age/age_controller.dart';
import 'package:bmi_check/app/mobile/home/components/height/height_selection_controller.dart';
import 'package:bmi_check/app/mobile/home/components/sex/sex_selection_widget_controller.dart';
import 'package:bmi_check/app/mobile/home/components/weight/weight_controller.dart';
import 'package:bmi_check/app/mobile/home/exceptions/empty_age_exception.dart';
import 'package:bmi_check/app/mobile/home/exceptions/empty_weight_exception.dart';
import 'package:bmi_check/app/mobile/home/exceptions/unselected_sex_exception.dart';
import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  SexSelected sexController = SexSelected();
  AgeController ageController = AgeController();
  HeightSelectionController heightController = HeightSelectionController();
  WeightController weightController = WeightController();

  double bmi = 0;
  String title = 'Unvalid BMI';
  String description = 'Go back in Home Page and recalculate!';

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

    bmi = weight / (height * height);  
  }
}