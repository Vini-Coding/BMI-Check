import 'package:bmi_check/app/mobile/settings/settings_language/controller/language_controller.dart';
import 'package:bmi_check/app/mobile/settings/settings_language/controller/settings_language_controller.dart';
import 'package:bmi_check/app/shared/interfaces/app_settings_repository_interface.dart';
import 'package:bmi_check/app/shared/l10n/flags.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:injector/injector.dart';

class SettingsLanguagePage extends StatefulWidget {
  static const routeName = '/settingsLanguage';
  const SettingsLanguagePage({super.key});

  @override
  State<SettingsLanguagePage> createState() => _SettingsLanguagePageState();
}

class _SettingsLanguagePageState extends State<SettingsLanguagePage> {
  final IAppSettingsRepository settingsRepository =
      Injector.appInstance.get<IAppSettingsRepository>();
  final LanguageController languageController =
      Injector.appInstance.get<LanguageController>();
  final SettingsLanguageController settingsLanguageController =
      Injector.appInstance.get<SettingsLanguageController>();

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    void goToSettings() {
      Navigator.pop(context);
    }

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        onPressed: goToSettings,
                        icon: const FaIcon(
                          FontAwesomeIcons.arrowLeftLong,
                          size: 30,
                        ),
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context)!.languageSettingsPageTitle,
                      style: textTheme.displayLarge,
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
                const SizedBox(height: 80),
                Expanded(
                  child: ListView(
                    children: [
                      RadioListTile<Locale>(
                        title: Text(
                          AppLocalizations.of(context)!.pageTileSystemDefault,
                          style: textTheme.bodyMedium,
                        ),
                        value: WidgetsBinding.instance.window.locale,
                        groupValue: settingsLanguageController.value,
                        activeColor: colorScheme.primary,
                        onChanged: (inputValue) {
                          if (inputValue == null) return;
                          setState(
                            () {
                              languageController.setSystemLocale();
                              settingsLanguageController.value = inputValue;
                              settingsRepository.updateSettings(
                                languageSettings: inputValue,
                              );
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                      RadioListTile<Locale>(
                        title: Text(
                          "普通话 ${Flags.china}",
                          style: textTheme.bodyMedium,
                        ),
                        value: const Locale('zh'),
                        groupValue: settingsLanguageController.value,
                        activeColor: colorScheme.primary,
                        onChanged: (inputValue) {
                          if (inputValue == null) return;
                          setState(
                            () {
                              languageController.setLocale(const Locale('zh'));
                              settingsLanguageController.value = inputValue;
                              settingsRepository.updateSettings(
                                languageSettings: inputValue,
                              );
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                      RadioListTile<Locale>(
                        title: Text(
                          "Deutsch ${Flags.germany}",
                          style: textTheme.bodyMedium,
                        ),
                        value: const Locale('de'),
                        groupValue: settingsLanguageController.value,
                        activeColor: colorScheme.primary,
                        onChanged: (inputValue) {
                          if (inputValue == null) return;
                          setState(
                            () {
                              languageController.setLocale(const Locale('de'));
                              settingsLanguageController.value = inputValue;
                              settingsRepository.updateSettings(
                                languageSettings: inputValue,
                              );
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                      RadioListTile<Locale>(
                        title: Text(
                          "English  ${Flags.usa}",
                          style: textTheme.bodyMedium,
                        ),
                        value: const Locale('en'),
                        groupValue: settingsLanguageController.value,
                        activeColor: colorScheme.primary,
                        onChanged: (inputValue) {
                          if (inputValue == null) return;
                          setState(
                            () {
                              languageController.setLocale(const Locale('en'));
                              settingsLanguageController.value = inputValue;
                              settingsRepository.updateSettings(
                                languageSettings: inputValue,
                              );
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                      RadioListTile<Locale>(
                        title: Text(
                          "Español ${Flags.spain}",
                          style: textTheme.bodyMedium,
                        ),
                        value: const Locale('es'),
                        groupValue: settingsLanguageController.value,
                        activeColor: colorScheme.primary,
                        onChanged: (inputValue) {
                          if (inputValue == null) return;
                          setState(
                            () {
                              languageController.setLocale(const Locale('es'));
                              settingsLanguageController.value = inputValue;
                              settingsRepository.updateSettings(
                                languageSettings: inputValue,
                              );
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                      RadioListTile<Locale>(
                        title: Text(
                          "Français ${Flags.france}",
                          style: textTheme.bodyMedium,
                        ),
                        value: const Locale('fr'),
                        groupValue: settingsLanguageController.value,
                        activeColor: colorScheme.primary,
                        onChanged: (inputValue) {
                          if (inputValue == null) return;
                          setState(
                            () {
                              languageController.setLocale(const Locale('fr'));
                              settingsLanguageController.value = inputValue;
                              settingsRepository.updateSettings(
                                languageSettings: inputValue,
                              );
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                      RadioListTile<Locale>(
                        title: Text(
                          "हिंदी ${Flags.india}",
                          style: textTheme.bodyMedium,
                        ),
                        value: const Locale('hi'),
                        groupValue: settingsLanguageController.value,
                        activeColor: colorScheme.primary,
                        onChanged: (inputValue) {
                          if (inputValue == null) return;
                          setState(
                            () {
                              languageController.value = inputValue;
                              settingsLanguageController.value = inputValue;
                              settingsRepository.updateSettings(
                                languageSettings: inputValue,
                              );
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                      RadioListTile<Locale>(
                        title: Text(
                          "Italiano ${Flags.italy}",
                          style: textTheme.bodyMedium,
                        ),
                        value: const Locale('it'),
                        groupValue: settingsLanguageController.value,
                        activeColor: colorScheme.primary,
                        onChanged: (inputValue) {
                          if (inputValue == null) return;
                          setState(
                            () {
                              languageController.setLocale(const Locale('it'));
                              settingsLanguageController.value = inputValue;
                              settingsRepository.updateSettings(
                                languageSettings: inputValue,
                              );
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                      RadioListTile<Locale>(
                        title: Text(
                          "日本 ${Flags.japan}",
                          style: textTheme.bodyMedium,
                        ),
                        value: const Locale('ja'),
                        groupValue: settingsLanguageController.value,
                        activeColor: colorScheme.primary,
                        onChanged: (inputValue) {
                          if (inputValue == null) return;
                          setState(
                            () {
                              languageController.setLocale(const Locale('ja'));
                              settingsLanguageController.value = inputValue;
                              settingsRepository.updateSettings(
                                languageSettings: inputValue,
                              );
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                      RadioListTile<Locale>(
                        title: Text(
                          "Português (Brasil) ${Flags.brazil}",
                          style: textTheme.bodyMedium,
                        ),
                        value: const Locale('pt'),
                        groupValue: settingsLanguageController.value,
                        activeColor: colorScheme.primary,
                        onChanged: (inputValue) {
                          if (inputValue == null) return;
                          setState(
                            () {
                              languageController.setLocale(const Locale('pt'));
                              settingsLanguageController.value = inputValue;
                              settingsRepository.updateSettings(
                                languageSettings: inputValue,
                              );
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                      RadioListTile<Locale>(
                        title: Text(
                          "Русский ${Flags.russia}",
                          style: textTheme.bodyMedium,
                        ),
                        value: const Locale('ru'),
                        groupValue: settingsLanguageController.value,
                        activeColor: colorScheme.primary,
                        onChanged: (inputValue) {
                          if (inputValue == null) return;
                          setState(
                            () {
                              languageController.setLocale(const Locale('ru'));
                              settingsLanguageController.value = inputValue;
                              settingsRepository.updateSettings(
                                languageSettings: inputValue,
                              );
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
