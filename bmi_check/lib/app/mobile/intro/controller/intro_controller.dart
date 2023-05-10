import 'package:bmi_check/app/shared/interfaces/app_settings_repository_interface.dart';
import 'package:flutter/material.dart';
import 'package:injector/injector.dart';

class IntroController extends ChangeNotifier {
  Future<void> setFirstEntry() async {
    IAppSettingsRepository settingsRepository =
        Injector.appInstance.get<IAppSettingsRepository>();
    settingsRepository.updateSettings(isFirstEntry: false);
  }
}
