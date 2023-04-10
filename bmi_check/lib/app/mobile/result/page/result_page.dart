import 'package:bmi_check/app/mobile/components/general_button_widget.dart';
import 'package:bmi_check/app/mobile/home/page/home_page.dart';
import 'package:bmi_check/app/mobile/result/args/result_arguments.dart';
import 'package:bmi_check/app/mobile/result/controller/result_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:screenshot/screenshot.dart';

class ResultPage extends StatefulWidget {
  static const routeName = '/result';
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments
        as ResultArguments; 
    ResultController resultController =
        ResultController(bmi: arguments.bmi, sex: arguments.sex,);
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;

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
                Screenshot(
                  controller: resultController.screenshotController,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    color: colorScheme.background,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          resultController.result.title,
                          style: textTheme.displayLarge,
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          arguments.bmi.toStringAsPrecision(4),
                          style: textTheme.displayMedium,
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          resultController.result.description,
                          style: textTheme.bodyMedium,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: GeneralButtonWidget(
                    text: 'Share',
                    onPressed: () {
                      double pixelRatio = MediaQuery.of(context).devicePixelRatio;
                      resultController.onShare(pixelRatio: pixelRatio);
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
