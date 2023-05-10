import 'package:bmi_check/app/mobile/settings/page/settings_page.dart';
import 'package:bmi_check/app/mobile/settings/settings_theme/settings_theme_controller.dart';
import 'package:bmi_check/app/shared/interfaces/app_settings_repository_interface.dart';
import 'package:bmi_check/app/shared/preferences/repository/app_settings_repository.dart';
import 'package:bmi_check/app/shared/themes/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:injector/injector.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsThemePage extends StatefulWidget {
  static const routeName = '/themesettings';
  const SettingsThemePage({super.key});

  @override
  State<SettingsThemePage> createState() => _SettingsThemePageState();
}

class _SettingsThemePageState extends State<SettingsThemePage> {
  final IAppSettingsRepository settingsRepository =
      Injector.appInstance.get<IAppSettingsRepository>();
  final ThemeController themeController =
      Injector.appInstance.get<ThemeController>();
  final SettingsThemeController settingsThemeController =
      Injector.appInstance.get<SettingsThemeController>();

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
                Expanded(
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
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
                            AppLocalizations.of(context)!
                                .themeSettingsPageTitle,
                            style: textTheme.displayLarge,
                          ),
                        ],
                      ),
                      const SizedBox(height: 80),
                      RadioListTile<ThemeMode>(
                        title: Text(
                          AppLocalizations.of(context)!.pageTileSystemDefault,
                          style: textTheme.bodyMedium,
                        ),
                        value: ThemeMode.system,
                        groupValue: settingsThemeController.value,
                        activeColor: colorScheme.primary,
                        onChanged: (inputValue) {
                          if (inputValue == null) return;
                          setState(
                            () {
                              settingsThemeController.value = inputValue;
                              themeController.getThemeSystem();
                              settingsRepository.updateSettings(
                                themeSettings: inputValue,
                              );
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                      RadioListTile<ThemeMode>(
                        title: Text(
                          AppLocalizations.of(context)!.themeSettingsPageTile2,
                          style: textTheme.bodyMedium,
                        ),
                        value: ThemeMode.light,
                        groupValue: settingsThemeController.value,
                        activeColor: colorScheme.primary,
                        onChanged: (inputValue) {
                          if (inputValue == null) return;
                          setState(
                            () {
                              settingsThemeController.value = inputValue;
                              themeController.toggleTheme(false);
                              settingsRepository.updateSettings(
                                themeSettings: inputValue,
                              );
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                      RadioListTile<ThemeMode>(
                        title: Text(
                          AppLocalizations.of(context)!.themeSettingsPageTile3,
                          style: textTheme.bodyMedium,
                        ),
                        value: ThemeMode.dark,
                        groupValue: settingsThemeController.value,
                        activeColor: colorScheme.primary,
                        onChanged: (inputValue) {
                          if (inputValue == null) return;
                          setState(
                            () {
                              settingsThemeController.value = inputValue;
                              themeController.toggleTheme(true);
                              settingsRepository.updateSettings(
                                themeSettings: inputValue,
                              );
                            },
                          );
                        },
                      ),
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
