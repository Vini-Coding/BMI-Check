import 'package:bmi_check/app/mobile/components/general_button_widget.dart';
import 'package:bmi_check/app/mobile/home/page/home_page.dart';
import 'package:bmi_check/app/mobile/result/args/result_arguments.dart';
import 'package:bmi_check/app/mobile/result/controller/result_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:screenshot/screenshot.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ResultPage extends StatefulWidget {
  static const routeName = '/result';
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as ResultArguments;
    ResultController resultController = ResultController(
      bmi: arguments.bmi,
      sex: arguments.sex,
    );
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    String shareText = AppLocalizations.of(context)!.shareText;

    void goToHome() {
      Navigator.pushReplacementNamed(context, HomePage.routeName);
    }

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
            child: Column(
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
                Expanded(
                  child: SingleChildScrollView(
                    child: Center(
                      child: Expanded(
                        child: SingleChildScrollView(
                          child: Screenshot(
                            controller: resultController.screenshotController,
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              color: colorScheme.background,
                              child: Column(
                                children: [
                                  Text(
                                    resultController.result.result(context).title,
                                    style: textTheme.displayLarge,
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    arguments.bmi.toStringAsPrecision(3),
                                    style: textTheme.displayMedium!
                                        .copyWith(fontSize: 150),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    resultController.result
                                        .result(context)
                                        .description,
                                    style: textTheme.bodyMedium,
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    AppLocalizations.of(context)!.idealWeightText(arguments.lowerIdealWeightLimit, arguments.upperIdealWeightLimit),
                                    style: textTheme.displaySmall,
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: GeneralButtonWidget(
                    text: AppLocalizations.of(context)!.shareButton,
                    onPressed: () {
                      double pixelRatio =
                          MediaQuery.of(context).devicePixelRatio;
                      resultController.onShare(
                          pixelRatio: pixelRatio, shareText: shareText);
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
