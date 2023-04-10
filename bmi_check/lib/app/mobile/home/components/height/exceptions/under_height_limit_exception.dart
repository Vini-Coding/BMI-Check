import 'package:bmi_check/app/shared/interfaces/handled_exception.dart';

class UnderHeightLimitException implements HandledException{
  @override
  String toString() {
    return "The height must be over 1.00";
  }
}