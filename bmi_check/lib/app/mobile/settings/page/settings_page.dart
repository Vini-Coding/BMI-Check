import 'package:bmi_check/app/mobile/home/page/home_page.dart';
import 'package:bmi_check/app/mobile/settings/components/settings_list_tile_widget.dart';
import 'package:bmi_check/app/mobile/settings/page/theme_settings/theme_settings_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingsPage extends StatefulWidget {
  static const routeName = '/settings';
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    void goToHome() {
      Navigator.pushReplacementNamed(context, HomePage.routeName);
    }

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        onPressed: goToHome,
                        icon: const FaIcon(
                          FontAwesomeIcons.arrowLeftLong,
                          size: 30,
                        ),
                      ),
                    ),
                    Text('Settings', style: textTheme.displayLarge),
                  ],
                ),
                const SizedBox(height: 80),
                SettingsListTileWidget(
                  icon: FontAwesomeIcons.ruler,
                  title: 'Height Metrics',
                  onTap: () {},
                ),
                SettingsListTileWidget(
                  icon: FontAwesomeIcons.weightScale,
                  title: 'Weight Metrics',
                  onTap: () {},
                ),
                SettingsListTileWidget(
                  icon: FontAwesomeIcons.globe,
                  title: 'Language',
                  onTap: () {},
                ),
                SettingsListTileWidget(
                  icon: FontAwesomeIcons.sun,
                  title: 'Theme Settings',
                  onTap: () {
                    Navigator.pushReplacementNamed(
                        context, ThemeSettingsPage.routeName);
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
