import 'package:bmi_check/app/mobile/settings/page/settings_page.dart';
import 'package:bmi_check/app/mobile/settings/settings_language/controller/language_controller.dart';
import 'package:bmi_check/app/mobile/settings/settings_language/controller/settings_language_controller.dart';
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
  final LanguageController languageController =
      Injector.appInstance.get<LanguageController>();
  final SettingsLanguageController settingsLanguageController =
      Injector.appInstance.get<SettingsLanguageController>();

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    void goToSettings() {
      Navigator.pushReplacementNamed(context, SettingsPage.routeName);
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
                RadioListTile(
                  title: Text(
                    "English  ${Flags.usa}",
                    style: textTheme.bodyMedium,
                  ),
                  value: 1,
                  groupValue: settingsLanguageController.value,
                  activeColor: colorScheme.primary,
                  onChanged: (val) {
                    setState(
                      () {
                        languageController.setLocale(const Locale('en'));
                        settingsLanguageController.value = val;
                      },
                    );
                  },
                ),
                const SizedBox(height: 10),
                RadioListTile(
                  title: Text(
                    "Deutsch ${Flags.germany}",
                    style: textTheme.bodyMedium,
                  ),
                  value: 2,
                  groupValue: settingsLanguageController.value,
                  activeColor: colorScheme.primary,
                  onChanged: (val) {
                    setState(
                      () {
                        languageController.setLocale(const Locale('de'));
                        settingsLanguageController.value = val;
                      },
                    );
                  },
                ),
                const SizedBox(height: 10),
                RadioListTile(
                  title: Text(
                    "Español ${Flags.spain}",
                    style: textTheme.bodyMedium,
                  ),
                  value: 3,
                  groupValue: settingsLanguageController.value,
                  activeColor: colorScheme.primary,
                  onChanged: (val) {
                    setState(
                      () {
                        languageController.setLocale(const Locale('es'));
                        settingsLanguageController.value = val;
                      },
                    );
                  },
                ),
                const SizedBox(height: 10),
                RadioListTile(
                  title: Text(
                    "Português (Brasil) ${Flags.brazil}",
                    style: textTheme.bodyMedium,
                  ),
                  value: 4,
                  groupValue: settingsLanguageController.value,
                  activeColor: colorScheme.primary,
                  onChanged: (val) {
                    setState(
                      () {
                        languageController.setLocale(const Locale('pt'));
                        settingsLanguageController.value = val;
                      },
                    );
                  },
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
