import 'package:bmi_check/app/mobile/settings/page/settings_page.dart';
import 'package:bmi_check/app/mobile/settings/settings_theme/settings_theme_controller.dart';
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
                          Text(AppLocalizations.of(context)!.themeSettingsPageTitle,
                              style: textTheme.displayLarge),
                        ],
                      ),
                      const SizedBox(height: 80),
                      RadioListTile(
                        title: Text(
                          AppLocalizations.of(context)!.pageTileSystemDefault,
                          style: textTheme.bodyMedium,
                        ),
                        value: 1,
                        groupValue: settingsThemeController.value,
                        activeColor: colorScheme.primary,
                        onChanged: (val) {
                          setState(() {
                            settingsThemeController.value = val;
                            themeController.getThemeSystem();
                          });
                        },
                      ),
                      RadioListTile(
                        title: Text(
                          AppLocalizations.of(context)!.themeSettingsPageTile2,
                          style: textTheme.bodyMedium,
                        ),
                        value: 2,
                        groupValue: settingsThemeController.value,
                        activeColor: colorScheme.primary,
                        onChanged: (val) {
                          setState(() {
                            settingsThemeController.value = val;
                            themeController.toggleTheme(false);
                          });
                        },
                      ),
                      const SizedBox(height: 10),
                      RadioListTile(
                        title: Text(
                          AppLocalizations.of(context)!.themeSettingsPageTile3,
                          style: textTheme.bodyMedium,
                        ),
                        value: 3,
                        groupValue: settingsThemeController.value,
                        activeColor: colorScheme.primary,
                        onChanged: (val) {
                          setState(() {
                            settingsThemeController.value = val;
                            themeController.toggleTheme(true);
                          });
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
