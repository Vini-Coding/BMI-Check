import 'package:bmi_check/app/shared/interfaces/handled_exception.dart';

class EmptyAgeException implements HandledException{
  @override
  String toString() {
    return "Insert a valid age";
  }
}