import 'package:bmi_check/app/shared/interfaces/handled_exception.dart';

class UnselectedSexException implements HandledException{
  @override
  String toString() {
    return "Choose your sex";
  }
}