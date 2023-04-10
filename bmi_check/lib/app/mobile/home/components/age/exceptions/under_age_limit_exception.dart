import 'package:bmi_check/app/shared/interfaces/handled_exception.dart';

class UnderAgeLimitException implements HandledException{
  @override
  String toString() {
    return "The age must be over 0";
  }
}