import 'package:bmi_check/app/mobile/settings/page/settings_page.dart';
import 'package:bmi_check/app/shared/themes/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:injector/injector.dart';

class ThemeSettingsPage extends StatefulWidget {
  static const routeName = '/themesettings';
  const ThemeSettingsPage({super.key});

  @override
  State<ThemeSettingsPage> createState() => _ThemeSettingsPageState();
}

class _ThemeSettingsPageState extends State<ThemeSettingsPage> {
  final ThemeController themeController =
      Injector.appInstance.get<ThemeController>();
  int? _value = 1;

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
                    Text('Theme\nSettings', style: textTheme.displayLarge),
                  ],
                ),
                const SizedBox(height: 80),
                RadioListTile(
                  title: Text(
                    "Light Theme",
                    style: textTheme.bodyMedium,
                  ),
                  value: 1,
                  groupValue: _value,
                  activeColor: colorScheme.primary,
                  onChanged: (val) {
                    setState(() {
                      _value = val;
                      themeController.toggleTheme(false);
                    });
                  },
                ),
                const SizedBox(height: 10),
                RadioListTile(
                  title: Text(
                    "Dark Theme",
                    style: textTheme.bodyMedium,
                  ),
                  value: 2,
                  groupValue: _value,
                  activeColor: colorScheme.primary,
                  onChanged: (val) {
                    setState(() {
                      _value = val;

                      themeController.toggleTheme(true);
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
