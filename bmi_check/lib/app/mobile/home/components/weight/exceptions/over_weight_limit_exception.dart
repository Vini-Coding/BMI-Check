import 'package:bmi_check/app/mobile/home/components/weight/weight_controller.dart';
import 'package:bmi_check/app/shared/interfaces/handled_exception.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:injector/injector.dart';

class OverWeightLimitException implements HandledException {
  @override
  String parseString(BuildContext context) {
    final WeightController weightController =
        Injector.appInstance.get<WeightController>();
    return AppLocalizations.of(context)!.overWeightLimitException(weightController.maxWeight);
  }
}