import 'package:bmi_check/app/mobile/settings/settings_height/controller/settings_height_controller.dart';
import 'package:bmi_check/app/mobile/settings/settings_height/enum/height_metrics_enum.dart';
import 'package:bmi_check/app/shared/interfaces/app_settings_repository_interface.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:injector/injector.dart';

class SettingsHeightPage extends StatefulWidget {
  static const routeName = '/settingsHeight';
  const SettingsHeightPage({super.key});

  @override
  State<SettingsHeightPage> createState() => _SettingsHeightPageState();
}

class _SettingsHeightPageState extends State<SettingsHeightPage> {
  final IAppSettingsRepository settingsRepository =
      Injector.appInstance.get<IAppSettingsRepository>();
  final SettingsHeightController settingsHeightController =
      Injector.appInstance.get<SettingsHeightController>();

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
                                .heightSettingsPageTitle,
                            style: textTheme.displayLarge,
                            textAlign: TextAlign.right,
                          ),
                        ],
                      ),
                      const SizedBox(height: 80),
                      RadioListTile<HeightMetrics>(
                        title: Text(
                          AppLocalizations.of(context)!.heightSettingsPageTile1,
                          style: textTheme.bodyMedium,
                        ),
                        value: HeightMetrics.feet,
                        groupValue: settingsHeightController.value,
                        activeColor: colorScheme.primary,
                        onChanged: (inputValue) {
                          if (inputValue == null) return;
                          setState(
                            () {
                              settingsHeightController.value = inputValue;
                              settingsRepository.updateSettings(
                                heightMetricsSettings: inputValue,
                              );
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                      RadioListTile<HeightMetrics>(
                        title: Text(
                          AppLocalizations.of(context)!.heightSettingsPageTile2,
                          style: textTheme.bodyMedium,
                        ),
                        value: HeightMetrics.inches,
                        groupValue: settingsHeightController.value,
                        activeColor: colorScheme.primary,
                        onChanged: (inputValue) {
                          if (inputValue == null) return;
                          setState(
                            () {
                              settingsHeightController.value = inputValue;
                              settingsRepository.updateSettings(
                                heightMetricsSettings: inputValue,
                              );
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                      RadioListTile<HeightMetrics>(
                        title: Text(
                          AppLocalizations.of(context)!.heightSettingsPageTile3,
                          style: textTheme.bodyMedium,
                        ),
                        value: HeightMetrics.meters,
                        groupValue: settingsHeightController.value,
                        activeColor: colorScheme.primary,
                        onChanged: (inputValue) {
                          if (inputValue == null) return;
                          setState(
                            () {
                              settingsHeightController.value = inputValue;
                              settingsRepository.updateSettings(
                                heightMetricsSettings: inputValue,
                              );
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                      RadioListTile<HeightMetrics>(
                        title: Text(
                          AppLocalizations.of(context)!.heightSettingsPageTile4,
                          style: textTheme.bodyMedium,
                        ),
                        value: HeightMetrics.centimeters,
                        groupValue: settingsHeightController.value,
                        activeColor: colorScheme.primary,
                        onChanged: (inputValue) {
                          if (inputValue == null) return;
                          setState(
                            () {
                              settingsHeightController.value = inputValue;
                              settingsRepository.updateSettings(
                                heightMetricsSettings: inputValue,
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
