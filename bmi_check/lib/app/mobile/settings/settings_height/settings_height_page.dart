import 'package:bmi_check/app/mobile/settings/page/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class SettingsHeightPage extends StatefulWidget {
  static const routeName = '/settingsHeight';
  const SettingsHeightPage({super.key});

  @override
  State<SettingsHeightPage> createState() => _SettingsHeightPageState();
}

class _SettingsHeightPageState extends State<SettingsHeightPage> {
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
                    Text(
                      AppLocalizations.of(context)!.heightSettingsPageTitle,
                      style: textTheme.displayLarge,
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
                const SizedBox(height: 80),
                RadioListTile(
                  title: Text(
                    AppLocalizations.of(context)!.heightSettingsPageTile1,
                    style: textTheme.bodyMedium,
                  ),
                  value: 1,
                  groupValue: _value,
                  activeColor: colorScheme.primary,
                  onChanged: (val) {
                    setState(() {
                      _value = val;
                    });
                  },
                ),
                const SizedBox(height: 10),
                RadioListTile(
                  title: Text(
                    AppLocalizations.of(context)!.heightSettingsPageTile2,
                    style: textTheme.bodyMedium,
                  ),
                  value: 2,
                  groupValue: _value,
                  activeColor: colorScheme.primary,
                  onChanged: (val) {
                    setState(() {
                      _value = val;
                    });
                  },
                ),
                const SizedBox(height: 10),
                RadioListTile(
                  title: Text(
                    AppLocalizations.of(context)!.heightSettingsPageTile3,
                    style: textTheme.bodyMedium,
                  ),
                  value: 3,
                  groupValue: _value,
                  activeColor: colorScheme.primary,
                  onChanged: (val) {
                    setState(() {
                      _value = val;
                    });
                  },
                ),
                const SizedBox(height: 10),
                RadioListTile(
                  title: Text(
                    AppLocalizations.of(context)!.heightSettingsPageTile4,
                    style: textTheme.bodyMedium,
                  ),
                  value: 4,
                  groupValue: _value,
                  activeColor: colorScheme.primary,
                  onChanged: (val) {
                    setState(() {
                      _value = val;
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
