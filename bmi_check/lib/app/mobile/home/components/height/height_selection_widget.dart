import 'package:bmi_check/app/mobile/home/components/height/exceptions/over_height_limit_exception.dart';
import 'package:bmi_check/app/mobile/home/components/height/height_selection_controller.dart';
import 'package:bmi_check/app/shared/interfaces/handled_exception.dart';
import 'package:bmi_check/app/shared/utils/show_error_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HeightSelectionWidget extends StatefulWidget {
  const HeightSelectionWidget(
      {required this.heightSelectionController, super.key});
  final HeightSelectionController heightSelectionController;

  @override
  State<HeightSelectionWidget> createState() => _HeightSelectionWidgetState();
}

class _HeightSelectionWidgetState extends State<HeightSelectionWidget> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    double minHeight = widget.heightSelectionController.minHeight;
    double maxHeight = widget.heightSelectionController.maxHeight;

    return ValueListenableBuilder(
      valueListenable: widget.heightSelectionController,
      builder: (context, height, child) {
        return Container(
          height: 160,
          width: double.maxFinite,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: SizedBox(
                    child: TextField(
                      controller:
                          widget.heightSelectionController.heightTextField,
                      keyboardType: TextInputType.number,
                      style: textTheme.displayLarge!.copyWith(fontSize: 50),
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      onSubmitted: (String heightSubmitted) {
                        try {
                          widget.heightSelectionController.height =
                              double.tryParse(
                            heightSubmitted,
                          );
                        } on HandledException catch (exception) {
                          if (exception is OverHeightLimitException) {
                            widget.heightSelectionController.height = maxHeight;
                          } else {
                            widget.heightSelectionController.height = minHeight;
                          }
                          showErrorSnackBar(
                            context: context,
                            exceptionText: exception.parseString(context),
                          );
                        }
                      },
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: colorScheme.primary,
                      radius: 18,
                      child: IconButton(
                        icon: FaIcon(
                          FontAwesomeIcons.minus,
                          color: colorScheme.surfaceVariant,
                          size: 18,
                        ),
                        onPressed: widget.heightSelectionController.decrement,
                      ),
                    ),
                    Expanded(
                      child: Slider(
                        value: height!.toDouble(),
                        min: minHeight,
                        max: maxHeight,
                        onChanged: (double sliderValue) => widget
                            .heightSelectionController
                            .onChanged(sliderValue),
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: colorScheme.primary,
                      radius: 18,
                      child: IconButton(
                        icon: FaIcon(
                          FontAwesomeIcons.plus,
                          color: colorScheme.surfaceVariant,
                          size: 18,
                        ),
                        onPressed: widget.heightSelectionController.increment,
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
