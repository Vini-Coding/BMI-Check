import 'package:bmi_check/app/mobile/home/page/home_page.dart';
import 'package:bmi_check/app/mobile/intro/components/intro_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class IntroPage extends StatefulWidget {
  static const routeName = '/intro';
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  void goToHome() {
    Navigator.pushReplacementNamed(context, HomePage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return IntroductionScreen(
      showDoneButton: false,
      showSkipButton: true,
      isTopSafeArea: true,
      isBottomSafeArea: true,
      globalBackgroundColor: Theme.of(context).colorScheme.background,
      scrollPhysics: const BouncingScrollPhysics(),
      skip:
          Text(AppLocalizations.of(context)!.skip, style: textTheme.labelSmall),
      next: FaIcon(
        FontAwesomeIcons.arrowRightLong,
        color: Theme.of(context).primaryColor,
      ),
      onSkip: goToHome,
      rawPages: [
        IntroPageWidget(
          isLastPage: false,
          imagePath: 'assets/vectors/intro1.png',
          title: AppLocalizations.of(context)!.titleIntroPage1,
          bodyText: AppLocalizations.of(context)!.bodyIntroPage1,
        ),
        IntroPageWidget(
          isLastPage: false,
          imagePath: 'assets/vectors/intro2.png',
          title: AppLocalizations.of(context)!.titleIntroPage2,
          bodyText: AppLocalizations.of(context)!.bodyIntroPage2,
        ),
        IntroPageWidget(
          isLastPage: true,
          imagePath: 'assets/vectors/intro3.png',
          title: AppLocalizations.of(context)!.titleIntroPage3,
          bodyText: AppLocalizations.of(context)!.bodyIntroPage3,
        ),
      ],
      dotsDecorator: DotsDecorator(
        size: const Size.square(10),
        activeSize: const Size(20, 10),
        color: Theme.of(context).colorScheme.outline,
        activeColor: Theme.of(context).primaryColor,
        spacing: const EdgeInsets.symmetric(horizontal: 3),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }
}
