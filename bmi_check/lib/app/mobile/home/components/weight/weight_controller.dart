import 'package:bmi_check/app/mobile/home/components/weight/exceptions/null_weight_exception.dart';
import 'package:bmi_check/app/mobile/home/components/weight/exceptions/over_weight_limit_exception.dart';
import 'package:bmi_check/app/mobile/home/components/weight/exceptions/under_weight_limit_exception.dart';
import 'package:bmi_check/app/mobile/settings/settings_weight/controller/settings_weight_controller.dart';
import 'package:bmi_check/app/mobile/settings/settings_weight/enum/weight_metrics_enum.dart';
import 'package:flutter/material.dart';
import 'package:injector/injector.dart';

class WeightController extends ValueNotifier<double?> {
  WeightController() : super(0);

  final SettingsWeightController controller =
      Injector.appInstance.get<SettingsWeightController>();
      
  double minWeight = 0;
  double get maxWeight {
    switch (controller.weightMetric) {
      case WeightMetrics.pounds:
        return 1323;
      case WeightMetrics.kilograms:
        return 600;
      default:
        return 600;
    }
  }

  String get weightMetrics {
    switch (controller.weightMetric) {
      case WeightMetrics.pounds:
        return "lb";
      case WeightMetrics.kilograms:
        return "kg";
      default:
        return "(kg)";
    }
  }

  late TextEditingController weightTextField = TextEditingController(
    text: minWeight.toStringAsPrecision(3),
  );

  double? get weight {
    return value;
  }

  set weight(double? weight) {
    weightValidate(weight.toString());
    value = weight!;
    weightTextField.text = weight.toStringAsPrecision(3);
  }

  void increment() {
    if (weight! <= maxWeight) {
      weight = weight! + 1;
    } else {
      null;
    }
  }

  void decrement() {
    if (weight! > 0) {
      weight = weight! - 1;
    } else {
      null;
    }
  }

  void weightValidate(String valueController) {
    if (valueController.isEmpty || double.tryParse(valueController) == null) {
      throw NullWeightException();
    } else if (double.tryParse(valueController)! < minWeight) {
      throw UnderWeightLimitException();
    } else if (double.tryParse(valueController)! > maxWeight) {
      throw OverWeightLimitException();
    }
  }
}
