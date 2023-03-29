import 'package:bmi_check/app/mobile/components/general_button_widget.dart';
import 'package:bmi_check/app/mobile/home/components/age_widget.dart';
import 'package:bmi_check/app/mobile/home/components/height_selection_widget.dart';
import 'package:bmi_check/app/mobile/home/components/sex_selection_widget.dart';
import 'package:bmi_check/app/mobile/home/components/weight_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    // void goToResult() {
    //   Navigator.pushReplacementNamed(context, ResultPage.routeName);
    // }
    // void goToSettings() {
    //   Navigator.pushReplacementNamed(context, SettingsPage.routeName);
    // }

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('BMI\nCheck', style: textTheme.displayLarge),
                      IconButton(
                        icon: const FaIcon(FontAwesomeIcons.gear, size: 34),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                  child: Text('Select your sex', style: textTheme.bodyMedium),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: SexSelectionWidget(),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 10, bottom: 5, left: 30, right: 30),
                  child: Text('Select your height', style: textTheme.bodyMedium),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                  child: HeightSelectionWidget(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      AgeWidget(),
                      WeightWidget(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, left: 30, right: 30),
                  child: GeneralButtonWidget(
                    text: 'Calculate',
                    onPressed: () {
                      
                    },
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
