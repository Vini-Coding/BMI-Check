import 'package:flutter/material.dart';
import 'package:bmi_check/app/shared/l10n/l10n.dart';

class LanguageController extends ValueNotifier<Locale?> {
  LanguageController() : super(const Locale('en'));

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
