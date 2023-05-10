import 'package:bmi_check/app/mobile/home/page/home_page.dart';
import 'package:bmi_check/app/mobile/intro/page/intro_page.dart';
import 'package:bmi_check/app/mobile/result/page/result_page.dart';
import 'package:bmi_check/app/mobile/settings/page/settings_page.dart';
import 'package:bmi_check/app/mobile/settings/settings_height/page/settings_height_page.dart';
import 'package:bmi_check/app/mobile/settings/settings_language/controller/language_controller.dart';
import 'package:bmi_check/app/mobile/settings/settings_language/page/settings_language_page.dart';
import 'package:bmi_check/app/mobile/settings/settings_theme/page/settings_theme_page.dart';
import 'package:bmi_check/app/mobile/settings/settings_weight/page/settings_weight_page.dart';
import 'package:bmi_check/app/shared/l10n/l10n.dart';
import 'package:bmi_check/app/shared/themes/dark/dark_theme.dart';
import 'package:bmi_check/app/shared/themes/light/light_theme.dart';
import 'package:bmi_check/app/shared/themes/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:injector/injector.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'shared/interfaces/app_settings_repository_interface.dart';

class BmiCheckApp extends StatefulWidget {
  const BmiCheckApp({super.key});

  @override
  State<BmiCheckApp> createState() => _BmiCheckAppState();
}

class _BmiCheckAppState extends State<BmiCheckApp> {
  final IAppSettingsRepository settingsRepository =
      Injector.appInstance.get<IAppSettingsRepository>();
  final ThemeController themeController =
      Injector.appInstance.get<ThemeController>();
  final LanguageController languageController =
      Injector.appInstance.get<LanguageController>();

  @override
  void initState() {
    settingsRepository.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeController,
      builder: (context, themeValue, child) {
        return ValueListenableBuilder(
          valueListenable: languageController,
          builder: (context, languageValue, child) {
            return MaterialApp(
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: L10n.all,
              locale: languageValue,
              debugShowCheckedModeBanner: false,
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: themeValue,
              initialRoute: settingsRepository.settings.isFirstEntry == true
                  ? IntroPage.routeName
                  : HomePage.routeName,
              routes: {
                IntroPage.routeName: (context) => const IntroPage(),
                HomePage.routeName: (context) => const HomePage(),
                ResultPage.routeName: (context) => const ResultPage(),
                SettingsPage.routeName: (context) => const SettingsPage(),
                SettingsThemePage.routeName: (context) =>
                    const SettingsThemePage(),
                SettingsHeightPage.routeName: (context) =>
                    const SettingsHeightPage(),
                SettingsWeightPage.routeName: (context) =>
                    const SettingsWeightPage(),
                SettingsLanguagePage.routeName: (context) =>
                    const SettingsLanguagePage(),
              },
            );
          },
        );
      },
    );
  }
}
