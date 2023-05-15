import 'package:bmi_check/app/mobile/settings/components/settings_list_tile_widget.dart';
import 'package:bmi_check/app/mobile/settings/settings_height/page/settings_height_page.dart';
import 'package:bmi_check/app/mobile/settings/settings_language/page/settings_language_page.dart';
import 'package:bmi_check/app/mobile/settings/settings_theme/page/settings_theme_page.dart';
import 'package:bmi_check/app/mobile/settings/settings_weight/page/settings_weight_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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

    void goToHome() {
      Navigator.pop(context);
    }

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: ListView(
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
                          Text(AppLocalizations.of(context)!.settingsPageTitle,
                              style: textTheme.displayLarge),
                        ],
                      ),
                      const SizedBox(height: 80),
                      SettingsListTileWidget(
                        icon: FontAwesomeIcons.ruler,
                        title:
                            AppLocalizations.of(context)!.heightMetricsListTile,
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            SettingsHeightPage.routeName,
                          );
                        },
                      ),
                      SettingsListTileWidget(
                        icon: FontAwesomeIcons.weightScale,
                        title:
                            AppLocalizations.of(context)!.weightMetricsListTile,
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            SettingsWeightPage.routeName,
                          );
                        },
                      ),
                      SettingsListTileWidget(
                        icon: FontAwesomeIcons.globe,
                        title: AppLocalizations.of(context)!
                            .languageSettingsListTile,
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            SettingsLanguagePage.routeName,
                          );
                        },
                      ),
                      SettingsListTileWidget(
                        icon: FontAwesomeIcons.sun,
                        title:
                            AppLocalizations.of(context)!.themeSettingsListTile,
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            SettingsThemePage.routeName,
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
