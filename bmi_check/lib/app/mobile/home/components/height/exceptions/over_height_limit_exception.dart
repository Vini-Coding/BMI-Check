import 'package:bmi_check/app/mobile/home/components/height/height_selection_controller.dart';
import 'package:bmi_check/app/shared/interfaces/handled_exception.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:injector/injector.dart';

class OverHeightLimitException implements HandledException {
  @override
  String parseString(BuildContext context) {
    final HeightSelectionController heightController =
        Injector.appInstance.get<HeightSelectionController>();
    return AppLocalizations.of(context)!
        .overHeightLimitException(heightController.maxHeight);
  }
}