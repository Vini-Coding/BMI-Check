import 'package:bmi_check/app/shared/interfaces/handled_exception.dart';
import 'package:flutter/material.dart';

class UnexpectedValueException extends HandledException {
  @override
  String parseString(BuildContext context) {
    return "Unexpected value";
  }
}
