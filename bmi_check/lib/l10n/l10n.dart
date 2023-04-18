import 'package:bmi_check/l10n/flags.dart';
import 'package:flutter/material.dart';

class L10n {
  static final all = [
    const Locale('en'),
    const Locale('pt'),
    const Locale('de'),
    const Locale('es'),
  ];

  static String getFlag(String code) {
    switch (code) {
      case 'en':
        return Flags.usa;
      case 'pt':
        return Flags.brazil;
      case 'de':
        return Flags.germany;
      case 'es':
        return Flags.spain;
      default:
        return Flags.usa;
    }
  }
}
