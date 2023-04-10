import 'package:bmi_check/app/shared/interfaces/handled_exception.dart';

class OverAgeLimitException implements HandledException{
  @override
  String toString() {
    return "The age must be under 120";
  }
}