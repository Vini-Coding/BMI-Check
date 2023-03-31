import 'package:bmi_check/app/mobile/components/general_button_widget.dart';
import 'package:bmi_check/app/mobile/home/components/age/age_widget.dart';
import 'package:bmi_check/app/mobile/home/components/height/height_selection_widget.dart';
import 'package:bmi_check/app/mobile/home/components/sex/sex_selection_widget.dart';
import 'package:bmi_check/app/mobile/home/components/weight/weight_widget.dart';
import 'package:bmi_check/app/mobile/home/controller/home_controller.dart';
import 'package:bmi_check/app/mobile/result/args/result_arguments.dart';
import 'package:bmi_check/app/mobile/result/page/result_page.dart';
import 'package:bmi_check/app/shared/interfaces/handled_exception.dart';
import 'package:bmi_check/app/shared/utils/show_error_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController controller = HomeController();

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    void goToResult() {
      Navigator.pushReplacementNamed(
        context,
        ResultPage.routeName,
        arguments: ResultArguments(
          bmi: controller.bmi,
          sex: controller.sexController.value,
        ),
      );
    }

    // TODO: SettingsPage isn't build yet
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
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: SexSelectionWidget(
                    sexSelected: controller.sexController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10, bottom: 5, left: 30, right: 30),
                  child:
                      Text('Select your height', style: textTheme.bodyMedium),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                  child: HeightSelectionWidget(
                      height: controller.heightController),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AgeWidget(age: controller.ageController),
                      WeightWidget(weight: controller.weightController),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, left: 30, right: 30),
                  child: GeneralButtonWidget(
                    text: 'Calculate',
                    onPressed: () {
                      try {
                        controller.validate();
                        controller.calculate();
                        goToResult();
                      } on HandledException catch (exception) {
                        showErrorSnackBar(
                          context: context,
                          exceptionText: exception.toString(),
                        );
                      }
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
