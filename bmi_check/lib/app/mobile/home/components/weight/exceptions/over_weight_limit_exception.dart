import 'package:bmi_check/app/shared/interfaces/handled_exception.dart';

class OverWeightLimitException implements HandledException{
  @override
  String toString() {
    return "The weight must be under 600";
  }
}