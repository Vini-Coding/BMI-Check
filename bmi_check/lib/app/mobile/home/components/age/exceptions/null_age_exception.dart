import 'package:bmi_check/app/shared/interfaces/handled_exception.dart';

class NullAgeException implements HandledException{
  @override
  String toString() {
    return "Insert a valid age";
  }
}