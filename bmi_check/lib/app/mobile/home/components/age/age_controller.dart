import 'package:bmi_check/app/mobile/home/components/age/exceptions/null_age_exception.dart';
import 'package:bmi_check/app/mobile/home/components/age/exceptions/over_age_limit_exception.dart';
import 'package:bmi_check/app/mobile/home/components/age/exceptions/under_age_limit_exception.dart';
import 'package:flutter/material.dart';

class AgeController extends ValueNotifier<int?> {
  AgeController() : super(0);

  int minAge = 0;
  int maxAge = 120;

  late TextEditingController ageTextField = TextEditingController(
    text: minAge.toString(),
  );

  int? get age {
    return value;
  }

  set age(int? age) {
    if (age != null) {
      value = age.round();
    } else {
      null;
    }
  }

  void increment() {
    if (age! < 120) {
      age = age! + 1;
      ageTextField.text = age.toString();
    } else {
      null;
    }
  }

  void decrement() {
    if (age! > 0) {
      age = age! - 1;
      ageTextField.text = age.toString();
    } else {
      null;
    }
  }

  void ageValidate(String valueController) {
    if (valueController.isEmpty || int.tryParse(valueController) == null) {
      age = minAge;
      ageTextField.text = minAge.toString();
      throw NullAgeException();
    } else if (int.tryParse(valueController)!.round() < 0) {
      age = minAge;
      ageTextField.text = minAge.toString();
      throw UnderAgeLimitException();
    } else if (int.tryParse(valueController)!.round() > 120) {
      age = maxAge;
      ageTextField.text = maxAge.toString();
      throw OverAgeLimitException();
    } else if (valueController is double) {
      age = int.tryParse(valueController)!.round();
      throw NullAgeException();
    }
  }

  void onSubmitted(String valueController) {
    ageValidate(valueController);
    age = int.tryParse(valueController);
  }

  void onChanged(String newChange) {
    age = int.tryParse(newChange);
  }
}
