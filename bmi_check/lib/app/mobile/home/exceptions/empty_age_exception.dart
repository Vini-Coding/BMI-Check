import 'package:bmi_check/app/shared/interfaces/handled_exception.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EmptyAgeException implements HandledException {
  @override
  String parseString(BuildContext context) {
    return AppLocalizations.of(context)!.emptyAgeException;
  }
}