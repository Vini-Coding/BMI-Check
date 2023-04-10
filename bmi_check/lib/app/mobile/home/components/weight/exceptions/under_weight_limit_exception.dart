import 'package:bmi_check/app/shared/interfaces/handled_exception.dart';

class UnderWeightLimitException implements HandledException{
  @override
  String toString() {
    return "The weight must be over 0";
  }
}