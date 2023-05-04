import 'package:flutter/material.dart';
import 'package:bmi_check/app/shared/l10n/l10n.dart';

class LanguageController extends ValueNotifier<Locale?> {
  LanguageController() : super(WidgetsBinding.instance.window.locale);

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

  void getSystemLocale() {
    value = WidgetsBinding.instance.window.locale;
  }
}
