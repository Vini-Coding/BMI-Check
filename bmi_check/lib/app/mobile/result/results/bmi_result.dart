import 'package:bmi_check/app/mobile/result/model/bmi_result_model.dart';
import 'package:flutter/material.dart';

abstract class BmiResult {
  BmiResultModel result(BuildContext context);
}
