import 'package:flutter/material.dart';

class SettingsLanguageController extends ValueNotifier {
  SettingsLanguageController() : super(0);

  void setValue(int newValue) {
    value = newValue;
  }
}