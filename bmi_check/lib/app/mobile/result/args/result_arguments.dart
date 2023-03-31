import 'package:bmi_check/app/mobile/home/components/sex/enum/sex_enum.dart';

class ResultArguments {
  final double bmi;
  final Sex? sex;

  ResultArguments({
    required this.bmi,
    required this.sex,
  });
}