import 'package:bmi_check/app/bmi_check_app.dart';
import 'package:bmi_check/app/shared/dependencies/register_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await registerDependencies();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const BmiCheckApp());
}