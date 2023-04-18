import 'package:bmi_check/l10n/l10n.dart';
import 'package:flutter/material.dart';

class SettingsLanguageController extends ValueNotifier<Locale?> {
  SettingsLanguageController() : super(Locale('en'));

  Locale get locale => value!;

  void setLocale(Locale newValue) {
    if (L10n.all.contains(newValue)) {
      value = newValue;
    } else {
      null;
    }
  }

  void clearLocale() {
    value = null;
  }
}
