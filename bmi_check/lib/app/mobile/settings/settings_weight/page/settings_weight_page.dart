import 'package:bmi_check/app/mobile/settings/settings_weight/controller/settings_weight_controller.dart';
import 'package:bmi_check/app/mobile/settings/settings_weight/enum/weight_metrics_enum.dart';
import 'package:bmi_check/app/shared/interfaces/app_settings_repository_interface.dart';
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
  final IAppSettingsRepository settingsRepository =
      Injector.appInstance.get<IAppSettingsRepository>();
  SettingsWeightController controller =
      Injector.appInstance.get<SettingsWeightController>();

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
                                .weightSettingsPageTitle,
                            style: textTheme.displayLarge,
                            textAlign: TextAlign.right,
                          ),
                        ],
                      ),
                      const SizedBox(height: 80),
                      RadioListTile<WeightMetrics>(
                        title: Text(
                          AppLocalizations.of(context)!.weightSettingsTile1,
                          style: textTheme.bodyMedium,
                        ),
                        value: WeightMetrics.pounds,
                        groupValue: controller.value,
                        activeColor: colorScheme.primary,
                        onChanged: (inputValue) {
                          if (inputValue == null) return;
                          setState(
                            () {
                              controller.value = inputValue;
                              settingsRepository.updateSettings(
                                weightMetricsSettings: inputValue,
                              );
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                      RadioListTile<WeightMetrics>(
                        title: Text(
                          AppLocalizations.of(context)!.weightSettingsTile2,
                          style: textTheme.bodyMedium,
                        ),
                        value: WeightMetrics.kilograms,
                        groupValue: controller.value,
                        activeColor: colorScheme.primary,
                        onChanged: (inputValue) {
                          if (inputValue == null) return;
                          setState(
                            () {
                              controller.value = inputValue;
                              settingsRepository.updateSettings(
                                weightMetricsSettings: inputValue,
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