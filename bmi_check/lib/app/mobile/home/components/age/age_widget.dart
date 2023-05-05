import 'package:bmi_check/app/mobile/home/components/age/age_controller.dart';
import 'package:bmi_check/app/shared/interfaces/handled_exception.dart';
import 'package:bmi_check/app/shared/utils/show_error_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AgeWidget extends StatefulWidget {
  const AgeWidget({required this.ageController, super.key});
  final AgeController ageController;

  @override
  State<AgeWidget> createState() => _AgeWidgetState();
}

class _AgeWidgetState extends State<AgeWidget> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return ValueListenableBuilder(
      valueListenable: widget.ageController,
      builder: (context, age, child) {
        return Container(
          height: 160,
          width: 160,
          margin: const EdgeInsets.only(right: 10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  AppLocalizations.of(context)!.age,
                  style: textTheme.bodyMedium,
                ),
                TextField(
                  controller: widget.ageController.ageTextField,
                  keyboardType: TextInputType.number,
                  style: textTheme.displayLarge!.copyWith(fontSize: 44),
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                  onChanged: (String newValueInTextField) {
                    widget.ageController.onChanged(newValueInTextField);
                  },
                  onSubmitted: (String ageSubmitted) {
                    try {
                      widget.ageController.onSubmitted(ageSubmitted);
                    } on HandledException catch (exception) {
                      showErrorSnackBar(
                        context: context,
                        exceptionText: exception.parseString(context),
                      );
                    }
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      backgroundColor: colorScheme.primary,
                      child: IconButton(
                        icon: FaIcon(
                          FontAwesomeIcons.minus,
                          color: colorScheme.surfaceVariant,
                        ),
                        onPressed: widget.ageController.decrement,
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: colorScheme.primary,
                      child: IconButton(
                        icon: FaIcon(
                          FontAwesomeIcons.plus,
                          color: colorScheme.surfaceVariant,
                        ),
                        onPressed: widget.ageController.increment,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
