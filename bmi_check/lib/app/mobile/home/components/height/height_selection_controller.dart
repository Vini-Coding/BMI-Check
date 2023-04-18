
import 'package:bmi_check/app/mobile/home/components/height/exceptions/null_height_exception.dart';
import 'package:bmi_check/app/mobile/home/components/height/exceptions/over_height_limit_exception.dart';
import 'package:bmi_check/app/mobile/home/components/height/exceptions/under_height_limit_exception.dart';
import 'package:flutter/material.dart';

class HeightSelectionController extends ValueNotifier<double?> {
  HeightSelectionController() : super(1.00);

  double minHeight = 1.00;
  double maxHeight = 2.50;

  late TextEditingController heightTextField = TextEditingController(
    text: minHeight.toStringAsPrecision(3),
  );

  double? get height {
    return value;
  }

  set height(double? height) {
    heightValidate(height.toString());
    value = height;
    heightTextField.text = height!.toStringAsPrecision(3);
  }

  void onChanged(double sliderValue) {
    height = sliderValue;
  }

  void increment() {
    if (height! < maxHeight) {
      height = height! + 0.01;
    } else {
      null;
    }
  }

  void decrement() {
    if (height! > minHeight) {
      height = height! - 0.01;
    } else {
      null;
    }
  }

  void heightValidate(String height) {
    if (height.isEmpty || double.tryParse(height) == null) {
      throw NullHeightException();
    } else if (double.tryParse(height)! >= 0 && double.tryParse(height)! < minHeight) {
      throw UnderHeightLimitException();
    } else if (double.tryParse(height)! > maxHeight) {
      throw OverHeightLimitException();
    }
  }
}
