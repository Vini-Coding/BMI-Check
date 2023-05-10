import 'dart:io';
import 'dart:typed_data';
import 'package:bmi_check/app/mobile/home/components/sex/enum/sex_enum.dart';
import 'package:bmi_check/app/mobile/result/results/bmi_result.dart';
import 'package:bmi_check/app/mobile/result/results/ideal_result.dart';
import 'package:bmi_check/app/mobile/result/results/obesity1_result.dart';
import 'package:bmi_check/app/mobile/result/results/obesity2_result.dart';
import 'package:bmi_check/app/mobile/result/results/obesity3_result.dart';
import 'package:bmi_check/app/mobile/result/results/overweight_result.dart';
import 'package:bmi_check/app/mobile/result/results/underweight_result.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class ResultController extends ValueNotifier<double> {
  ResultController({
    required this.bmi,
    required this.sex,
  }) : super(bmi);

  final double bmi;
  final Sex? sex;

  ScreenshotController screenshotController = ScreenshotController();

  BmiResult resultFemale() {
    if (bmi < 18.6) {
      return UnderweightResult();
    } else if (bmi >= 18.6 && bmi <= 24.9) {
      return IdealResult();
    } else if (bmi >= 24.9 && bmi <= 29.9) {
      return OverweightResult();
    } else if (bmi >= 29.9 && bmi <= 34.9) {
      return Obesity1Result();
    } else if (bmi >= 34.9 && bmi <= 38.9) {
      return Obesity2Result();
    } else {
      return Obesity3Result();
    }
  }

  BmiResult resultMale() {
    if (bmi < 19.6) {
      return UnderweightResult();
    } else if (bmi >= 19.6 && bmi <= 25.9) {
      return IdealResult();
    } else if (bmi >= 25.9 && bmi <= 30.9) {
      return OverweightResult();
    } else if (bmi >= 30.9 && bmi <= 35.9) {
      return Obesity1Result();
    } else if (bmi >= 35.9 && bmi <= 39.9) {
      return Obesity2Result();
    } else {
      return Obesity3Result();
    }
  }

  BmiResult get result {
    if (sex == Sex.feminine) {
      return resultFemale();
    } else {
      return resultMale();
    }
  }

  Future<void> onShare(
      {required double pixelRatio, required String shareText}) async {
    final Uint8List? screenshot = await screenshotController.capture(
      pixelRatio: pixelRatio,
      delay: const Duration(milliseconds: 10),
    );

    final Directory directory = await getApplicationDocumentsDirectory();

    final File imageFile = await File("${directory.path}/mybmi.png").create();

    await imageFile.writeAsBytes(screenshot!);
    await Share.shareXFiles(
      [XFile(imageFile.path)],
      text: shareText,
    );
  }
}
