import 'package:bmi_check/app/mobile/home/controller/height_selection_controller.dart';
import 'package:flutter/material.dart';

class HeightSelectionWidget extends StatefulWidget {
  const HeightSelectionWidget({super.key});

  @override
  State<HeightSelectionWidget> createState() => _HeightSelectionWidgetState();
}

class _HeightSelectionWidgetState extends State<HeightSelectionWidget> {
  HeightSelectionController height = HeightSelectionController();

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return ValueListenableBuilder(
      valueListenable: height,
      builder: (context, value, child) {
        return Container(
          height: 160,
          width: double.maxFinite,
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
                Slider(
                  value: value.toDouble(),
                  min: 1.00,
                  max: 2.50,
                  onChanged: (double sliderValue) =>
                      height.onChanged(sliderValue),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
