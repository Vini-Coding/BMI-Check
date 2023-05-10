import 'package:flutter/material.dart';
import 'package:bmi_check/app/shared/l10n/l10n.dart';

class LanguageController extends ValueNotifier<Locale> {
  LanguageController(Locale initValue) : super(initValue);

  Locale get locale => value;

  void setLocale(Locale newValue) {
    if (L10n.all.contains(newValue)) {
      value = newValue;
    } else {
      null;
    }
  }

  void setSystemLocale() {
    value = WidgetsBinding.instance.window.locale;
  }
}
