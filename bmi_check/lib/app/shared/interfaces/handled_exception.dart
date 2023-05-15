import 'package:flutter/material.dart';

abstract class HandledException implements Exception {
  String parseString(BuildContext context);
}