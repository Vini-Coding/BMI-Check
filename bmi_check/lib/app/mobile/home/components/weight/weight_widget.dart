import 'package:bmi_check/app/mobile/home/components/weight/exceptions/over_weight_limit_exception.dart';
import 'package:bmi_check/app/mobile/home/components/weight/weight_controller.dart';
import 'package:bmi_check/app/shared/interfaces/handled_exception.dart';
import 'package:bmi_check/app/shared/utils/show_error_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WeightWidget extends StatefulWidget {
  const WeightWidget({required this.weightController, super.key});
  final WeightController weightController;

  @override
  State<WeightWidget> createState() => _WeightWidgetState();
}

class _WeightWidgetState extends State<WeightWidget> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    double minWeight = widget.weightController.minWeight;
    double maxWeight = widget.weightController.maxWeight;

    return ValueListenableBuilder(
      valueListenable: widget.weightController,
      builder: (context, weight, child) {
        return Container(
          height: 160,
          width: 160,
          margin: const EdgeInsets.only(left: 20),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            color: colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.weight,
                      style: textTheme.bodyMedium,
                    ),
                    Text(
                      AppLocalizations.of(context)!.weightMetric(
                        widget.weightController.weightMetrics,
                      ),
                      style: textTheme.bodyMedium!
                          .copyWith(fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
                TextField(
                  controller: widget.weightController.weightTextField,
                  keyboardType: TextInputType.number,
                  style: textTheme.displayLarge!.copyWith(fontSize: 44),
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                  onSubmitted: (String submittedText) {
                    try {
                      widget.weightController.weight = double.tryParse(
                        submittedText,
                      );
                    } on HandledException catch (exception) {
                      if (exception is OverWeightLimitException) {
                        widget.weightController.weight = maxWeight;
                      } else {
                        widget.weightController.weight = minWeight;
                      }
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
                        onPressed: widget.weightController.decrement,
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: colorScheme.primary,
                      child: IconButton(
                        icon: FaIcon(
                          FontAwesomeIcons.plus,
                          color: colorScheme.surfaceVariant,
                        ),
                        onPressed: widget.weightController.increment,
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
