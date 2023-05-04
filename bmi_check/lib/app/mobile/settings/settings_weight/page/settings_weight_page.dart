import 'package:bmi_check/app/mobile/settings/page/settings_page.dart';
import 'package:bmi_check/app/mobile/settings/settings_weight/controller/settings_weight_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:injector/injector.dart';

class SettingsWeightPage extends StatefulWidget {
  static const routeName = '/settingsWeight';
  const SettingsWeightPage({super.key});

  @override
  State<SettingsWeightPage> createState() => _SettingsWeightPageState();
}

class _SettingsWeightPageState extends State<SettingsWeightPage> {
  SettingsWeightController controller =
      Injector.appInstance.get<SettingsWeightController>();

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
                            AppLocalizations.of(context)!.weightSettingsPageTitle,
                            style: textTheme.displayLarge,
                            textAlign: TextAlign.right,
                          ),
                        ],
                      ),
                      const SizedBox(height: 80),
                      RadioListTile(
                        title: Text(
                          AppLocalizations.of(context)!.weightSettingsTile1,
                          style: textTheme.bodyMedium,
                        ),
                        value: 1,
                        groupValue: controller.value,
                        activeColor: colorScheme.primary,
                        onChanged: (inputValue) {
                          setState(() {
                            controller.value = inputValue;
                          });
                        },
                      ),
                      const SizedBox(height: 10),
                      RadioListTile(
                        title: Text(
                          AppLocalizations.of(context)!.weightSettingsTile2,
                          style: textTheme.bodyMedium,
                        ),
                        value: 2,
                        groupValue: controller.value,
                        activeColor: colorScheme.primary,
                        onChanged: (inputValue) {
                          setState(() {
                            controller.value = inputValue;
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
