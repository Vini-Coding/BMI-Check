import 'package:bmi_check/app/shared/l10n/flags.dart';
import 'package:flutter/material.dart';

class L10n {
  static final all = [
    const Locale('en'),
    const Locale('pt'),
    const Locale('de'),
    const Locale('es'),
    const Locale('ch'),
    const Locale('fr'),
    const Locale('in'),
    const Locale('it'),
    const Locale('ja'),
    const Locale('ru'),
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
      case 'jp':
        return Flags.japan;
      case 'ch':
        return Flags.china;
      case 'fr':
        return Flags.france;
      case 'ru':
        return Flags.russia;
      case 'it':
        return Flags.italy;
      case 'in':
        return Flags.india;
      default:
        return Flags.usa;
    }
  }
}
