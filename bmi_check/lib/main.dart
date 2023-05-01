import 'package:bmi_check/app/bmi_check_app.dart';
import 'package:bmi_check/app/shared/dependencies/register_dependencies.dart';
import 'package:flutter/material.dart';

void main() {
  registerDependencies();
  runApp(BmiCheckApp());
} 