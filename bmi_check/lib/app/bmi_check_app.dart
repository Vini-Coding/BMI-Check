import 'package:bmi_check/app/mobile/home/page/home_page.dart';
import 'package:bmi_check/app/mobile/intro/page/intro_page.dart';
import 'package:bmi_check/app/shared/themes/dark/dark_theme.dart';
import 'package:bmi_check/app/shared/themes/light/light_theme.dart';
import 'package:bmi_check/app/shared/themes/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:injector/injector.dart';

class BmiCheckApp extends StatelessWidget {
  const BmiCheckApp({super.key});


  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Injector.appInstance.get<ThemeController>();

    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeController,
      builder: (context, value, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: value,
          initialRoute: IntroPage.routeName,
          routes: {
            IntroPage.routeName: (context) => const IntroPage(),
            HomePage.routeName: (context) => const HomePage(),
          },
        );
      },
    );
  }
}
