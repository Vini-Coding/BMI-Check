import 'package:bmi_check/app/mobile/home/components/height/height_selection_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HeightSelectionWidget extends StatefulWidget {
  const HeightSelectionWidget({required this.height, super.key});
  final HeightSelectionController height;

  @override
  State<HeightSelectionWidget> createState() => _HeightSelectionWidgetState();
}

class _HeightSelectionWidgetState extends State<HeightSelectionWidget> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return ValueListenableBuilder(
      valueListenable: widget.height,
      builder: (context, value, child) {
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      value.toStringAsPrecision(3),
                      style: textTheme.displayLarge,
                    ),
                    Text(
                      'm',
                      style: textTheme.displayLarge,
                    ),
                  ],
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
                        onPressed: widget.height.decrement,
                      ),
                    ),
                    Expanded(
                      child: Slider(
                        value: value.toDouble(),
                        min: 1.00,
                        max: 2.50,
                        onChanged: (double sliderValue) =>
                            widget.height.onChanged(sliderValue),
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
                        onPressed: widget.height.increment,
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
