import 'package:bmi_check/app/mobile/result/results/bmi_result.dart';
import 'package:bmi_check/app/mobile/result/args/bmi_result_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UnderweightResult implements BmiResult {
  @override
  BmiResultModel result(BuildContext context) {
    return BmiResultModel(
      title: AppLocalizations.of(context)!.underWeightResultTitle,
      description: AppLocalizations.of(context)!.underWeightResultDescription,
    );
  }
}
