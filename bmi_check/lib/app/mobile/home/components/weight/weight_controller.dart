import 'package:flutter/material.dart';

class WeightController extends ValueNotifier<double> {
  WeightController() : super(0);

  TextEditingController weightTextField = TextEditingController();

  void increment() {
    value++;
    weightTextField.text = value.toInt().toString();
  }

  void decrement() {
    if (value > 0) {
      value--;
      weightTextField.text = value.toInt().toString();
    } else {
      null;
    }
  }

  void weightSubmitted(String valueController) {
    if (valueController == '') {
      value = 0;
    } else {
      value = double.parse(valueController);
      weightTextField.text = value.toString();
    }
  }

  //IS NOT WORKING
  void weightChanged(String valueController) {
    if (weightTextField.text.isEmpty) {
      weightTextField.text = 0.toString();
      value = double.parse(weightTextField.text);
    } else {
      value = double.parse(valueController);
      weightTextField.text = value.toString();
    }
  }
}
