import 'package:flutter/material.dart';

class AgeController extends ValueNotifier<int> {
  AgeController() : super(0);

  TextEditingController ageController = TextEditingController();

  void increment() {
    value++;
    ageController.text = value.toInt().toString();
  }

  void decrement() {
    if (value > 0) {
      value--;
      ageController.text = value.toInt().toString();
    } else {
      null;
    }
  }

  void ageSubmitted(String valueController) {
    if (valueController == '') {
      value = 0;
    } else {
      value = int.parse(valueController);
      ageController.text = value.toString();
    }
  }
}
