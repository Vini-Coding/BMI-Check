import 'package:flutter/material.dart';

class HeightSelectionController extends ValueNotifier<double> {
  HeightSelectionController() : super(1.00);

  void onChanged(double sliderValue) {
    value = sliderValue;
  }

  void increment() {
    if (value <= 2.49) {
      value = value + 0.01;
    } else {
      null;
    }
  }

  void decrement() {
    if (value > 1.00) {
      value = value - 0.01;
    } else {
      null;
    }
  }
}
