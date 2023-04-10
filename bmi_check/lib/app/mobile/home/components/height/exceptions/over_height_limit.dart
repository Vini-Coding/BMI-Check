import 'package:bmi_check/app/shared/interfaces/handled_exception.dart';

class OverHeightLimitException implements HandledException{
  @override
  String toString() {
    return "The height must be under 2.50";
  }
}