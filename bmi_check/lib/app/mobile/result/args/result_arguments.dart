import 'package:bmi_check/app/mobile/home/components/sex/enum/sex_enum.dart';

class ResultArguments {
  final double bmi;
  final Sex? sex;
  final String lowerIdealWeightLimit;
  final String upperIdealWeightLimit;

  ResultArguments({
    required this.bmi,
    required this.sex,
    required this.lowerIdealWeightLimit,
    required this.upperIdealWeightLimit,
  });
}