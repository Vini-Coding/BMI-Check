import 'package:bmi_check/app/bmi_check_app.dart';
import 'package:bmi_check/app/shared/dependencies/register_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  registerDependencies();
  runApp(BmiCheckApp());
}