import 'package:flutter/material.dart';

class HeightSelectionController extends ValueNotifier<double> {
  HeightSelectionController() : super(1.00);

  void onChanged(double sliderValue) {
    value = sliderValue;
  }
}
