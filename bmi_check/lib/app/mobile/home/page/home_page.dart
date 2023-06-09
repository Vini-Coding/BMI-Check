import 'package:bmi_check/app/mobile/components/general_button_widget.dart';
import 'package:bmi_check/app/mobile/home/components/age/age_widget.dart';
import 'package:bmi_check/app/mobile/home/components/height/height_selection_widget.dart';
import 'package:bmi_check/app/mobile/home/components/sex/sex_selection_widget.dart';
import 'package:bmi_check/app/mobile/home/components/weight/weight_widget.dart';
import 'package:bmi_check/app/mobile/home/controller/home_controller.dart';
import 'package:bmi_check/app/mobile/result/args/result_arguments.dart';
import 'package:bmi_check/app/mobile/result/page/result_page.dart';
import 'package:bmi_check/app/mobile/settings/page/settings_page.dart';
import 'package:bmi_check/app/shared/interfaces/handled_exception.dart';
import 'package:bmi_check/app/shared/utils/show_error_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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

    void goToResult() {
      Navigator.pushNamed(
        context,
        ResultPage.routeName,
        arguments: ResultArguments(
          bmi: controller.bmi,
          lowerIdealWeightLimit: controller.lowerIdealWeightLimit,
          upperIdealWeightLimit: controller.upperIdealWeightLimit,
          sex: controller.sexController.value,
        ),
      );
    }

    void goToSettings() {
      Navigator.pushNamed(context, SettingsPage.routeName);
    }

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
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
                      Text(
                        AppLocalizations.of(context)!.appTitle,
                        style: textTheme.displayLarge,
                      ),
                      IconButton(
                        icon: const FaIcon(FontAwesomeIcons.gear, size: 34),
                        onPressed: goToSettings,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 30,
                  ),
                  child: Text(
                    AppLocalizations.of(context)!.selectSexPrompt,
                    style: textTheme.bodyMedium,
                  ),
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.selectHeightPrompt,
                        style: textTheme.bodyMedium,
                      ),
                      Text(
                        AppLocalizations.of(context)!.heightMetric(
                          controller.heightController.heightMetrics,
                        ),
                        style: textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 30,
                  ),
                  child: HeightSelectionWidget(
                    heightSelectionController: controller.heightController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AgeWidget(
                        ageController: controller.ageController,
                      ),
                      WeightWidget(
                        weightController: controller.weightController,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 15, left: 30, right: 30, bottom: 20),
                  child: GeneralButtonWidget(
                    text: AppLocalizations.of(context)!.calculateButton,
                    onPressed: () {
                      try {
                        controller.validate();
                        controller.bmiCalculate();
                        goToResult();
                      } on HandledException catch (exception) {
                        showErrorSnackBar(
                          context: context,
                          exceptionText: exception.parseString(context),
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