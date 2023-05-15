import 'package:bmi_check/app/mobile/components/general_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class IntroPageWidget extends StatelessWidget {
  const IntroPageWidget({
    this.isLastPage = false,
    required this.imagePath,
    required this.title,
    required this.bodyText,
    this.onPressed,
    super.key,
  });

  final String imagePath;
  final String title;
  final String bodyText;
  final bool isLastPage;
  final Future<void> Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(height: 80),
          Image.asset(
            imagePath,
            height: 368,
            width: 368,
          ),
          const SizedBox(height: 30),
          Text(
            title,
            style: textTheme.displayLarge,
            textAlign: TextAlign.center,
            overflow: TextOverflow.fade,
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Text(bodyText,
                style: textTheme.bodyMedium, textAlign: TextAlign.center),
          ),
          const SizedBox(height: 40),
          if (isLastPage && onPressed != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: GeneralButtonWidget(
                onPressed: onPressed!,
                text: AppLocalizations.of(context)!.getStartedButton,
              ),
            ),
          const SizedBox(height: 64),
        ],
      ),
    );
  }
}
