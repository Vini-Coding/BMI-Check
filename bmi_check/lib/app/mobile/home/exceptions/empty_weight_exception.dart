import 'package:bmi_check/app/shared/interfaces/handled_exception.dart';

class EmptyWeightException implements HandledException{
  @override
  String toString() {
    return "Insert a valid weight";
  }
}