import 'package:flutter/material.dart';

class WeightController extends ValueNotifier<double> {
  WeightController() : super(0);

  TextEditingController weightController = TextEditingController();

  void increment() {
    value++;
    weightController.text = value.toInt().toString();
  }

  void decrement() {
    if (value > 0) {
      value--;
      weightController.text = value.toInt().toString();
    } else {
      null;
    }
  }

  void weightSubmitted(String valueController) {
    if (valueController == '') {
      value = 0;
    } else {
      value = double.parse(valueController);
      weightController.text = value.toString();
    }
  }

  //IS NOT WORKING
  void weightChanged(String valueController) {
    if (weightController.text.isEmpty) {
      weightController.text = 0.toString();
      value = double.parse(weightController.text);
    } else {
      value = double.parse(valueController);
      weightController.text = value.toString();
    }
  }
}
