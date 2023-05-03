import 'package:flutter/material.dart';

class SettingsLanguageController extends ValueNotifier {
  SettingsLanguageController() : super(3);

  void setValue(int newValue) {
    value = newValue;
  }
}