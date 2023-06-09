import 'package:bmi_check/app/mobile/home/components/height/exceptions/null_height_exception.dart';
import 'package:bmi_check/app/mobile/home/components/height/exceptions/over_height_limit_exception.dart';
import 'package:bmi_check/app/mobile/home/components/height/exceptions/under_height_limit_exception.dart';
import 'package:bmi_check/app/mobile/settings/settings_height/controller/settings_height_controller.dart';
import 'package:bmi_check/app/mobile/settings/settings_height/enum/height_metrics_enum.dart';
import 'package:flutter/material.dart';
import 'package:injector/injector.dart';

class HeightSelectionController extends ValueNotifier<double?> {
  HeightSelectionController() : super(_getMinHeight(HeightMetrics.feet));

  SettingsHeightController controller =
      Injector.appInstance.get<SettingsHeightController>();

  static double _getMinHeight(HeightMetrics heightMetric) {
    switch (heightMetric) {
      case HeightMetrics.feet:
        return 3.28;
      case HeightMetrics.inches:
        return 39.37;
      case HeightMetrics.meters:
        return 1.00;
      case HeightMetrics.centimeters:
        return 100;
      default:
        return 1.00;
    }
  }

  double get minHeight => _getMinHeight(controller.value);

  void initValue() {
    value = minHeight;
  }

  double get maxHeight {
    switch (controller.value) {
      case HeightMetrics.feet:
        return 8.20;
      case HeightMetrics.inches:
        return 98.42;
      case HeightMetrics.meters:
        return 2.50;
      case HeightMetrics.centimeters:
        return 250;
      default:
        return 2.50;
    }
  }

  String get heightMetrics {
    switch (controller.value) {
      case HeightMetrics.feet:
        return "(ft)";
      case HeightMetrics.inches:
        return "(in)";
      case HeightMetrics.meters:
        return "(m)";
      case HeightMetrics.centimeters:
        return "(cm)";
      default:
        return "(m)";
    }
  }

  late TextEditingController heightTextField = TextEditingController(
    text: minHeight.toStringAsPrecision(3),
  );

  double? get height {
    return value;
  }

  set height(double? height) {
    value = height;
    heightTextField.text = height!.toStringAsPrecision(3);
  }

  void onChanged(double sliderValue) {
    height = sliderValue;
    heightTextField.text = height!.toStringAsPrecision(3);
  }

  void increment() {
    switch (controller.value) {
      case HeightMetrics.feet:
        if (height! < maxHeight) {
          height = height! + 0.01;
          heightTextField.text = height!.toStringAsPrecision(3);
        } else {
          null;
        }
        return;
      case HeightMetrics.inches:
        if (height! < maxHeight) {
          height = height! + 0.1;
          heightTextField.text = height!.toStringAsPrecision(3);
        } else {
          null;
        }
        return;
      case HeightMetrics.meters:
        if (height! < maxHeight) {
          height = height! + 0.01;
          heightTextField.text = height!.toStringAsPrecision(3);
        } else {
          null;
        }
        return;
      case HeightMetrics.centimeters:
        if (height! < maxHeight) {
          height = height! + 1;
          heightTextField.text = height!.toStringAsPrecision(3);
        } else {
          null;
        }
        return;
      default:
        if (height! < maxHeight) {
          height = height! + 0.01;
          heightTextField.text = height!.toStringAsPrecision(3);
        } else {
          null;
        }
        return;
    }
  }

  void decrement() {
    switch (controller.value) {
      case HeightMetrics.feet:
        if (height! > minHeight) {
          height = height! - 0.01;
          heightTextField.text = height!.toStringAsPrecision(3);
        } else {
          null;
        }
        return;
      case HeightMetrics.inches:
        if (height! > minHeight) {
          height = height! - 0.1;
          heightTextField.text = height!.toStringAsPrecision(3);
        } else {
          null;
        }
        return;
      case HeightMetrics.meters:
        if (height! > minHeight) {
          height = height! - 0.01;
          heightTextField.text = height!.toStringAsPrecision(3);
        } else {
          null;
        }
        return;
      case HeightMetrics.centimeters:
        if (height! > minHeight) {
          height = height! - 1;
          heightTextField.text = height!.toStringAsPrecision(3);
        } else {
          null;
        }
        return;
      default:
        if (height! > minHeight) {
          height = height! - 0.01;
          heightTextField.text = height!.toStringAsPrecision(3);
        } else {
          null;
        }
        return;
    }
  }

  void heightValidate(String heightToValidate) {
    if (heightToValidate.isEmpty || double.tryParse(heightToValidate) == null) {
      height = minHeight;
      heightTextField.text = minHeight.toStringAsPrecision(3);
      throw NullHeightException();
    } else if (double.tryParse(heightToValidate)! >= 0 &&
        double.tryParse(heightToValidate)! < minHeight) {
      height = minHeight;
      heightTextField.text = minHeight.toStringAsPrecision(3);
      throw UnderHeightLimitException();
    } else if (double.tryParse(heightToValidate)! > maxHeight) {
      height = maxHeight;
      heightTextField.text = maxHeight.toStringAsPrecision(3);
      throw OverHeightLimitException();
    }
  }

  void onSubmitted(String valueController) {
    heightValidate(valueController);
    height = double.tryParse(valueController);
  }
}
