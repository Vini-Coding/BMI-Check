import 'dart:math';

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
    ageValidate(age.toString());
    value = age!.round();
    ageTextField.text = age.toInt().toString();
  }

  void increment() {
    if (age! < 120) {
      age = age! + 1;
    } else {
      null;
    }
  }

  void decrement() {
    if (age! > 0) {
      age = age! - 1;
    } else {
      null;
    }
  }

  void ageValidate(String valueController) {
    if (valueController.isEmpty || int.tryParse(valueController) == null) {
      throw NullAgeException();
    } else if (int.tryParse(valueController)!.round() < 0) {
      throw UnderAgeLimitException();
    } else if (int.tryParse(valueController)!.round() > 120) {
      throw OverAgeLimitException();
    } else if (valueController is double) {
      age = int.tryParse(valueController)!.round();
      throw NullAgeException();
    }
  }
}
