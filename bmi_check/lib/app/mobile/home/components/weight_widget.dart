import 'package:bmi_check/app/mobile/home/controller/weight_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WeightWidget extends StatefulWidget {
  const WeightWidget({super.key});

  @override
  State<WeightWidget> createState() => _WeightWidgetState();
}

class _WeightWidgetState extends State<WeightWidget> {
  WeightController weight = WeightController();

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return ValueListenableBuilder(
      valueListenable: weight,
      builder: (context, value, child) {
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
                      'Weight',
                      style: textTheme.bodyMedium,
                    ),
                    Text(
                      ' (kg)',
                      style: textTheme.bodyMedium,
                    ),
                  ],
                ),
                TextField(
                  controller: weight.weightController,
                  keyboardType: TextInputType.number,
                  style: textTheme.displayLarge!.copyWith(fontSize: 44),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: value.toInt().toString(),
                    hintStyle: textTheme.displayLarge!.copyWith(fontSize: 44),
                  ),
                  onSubmitted: (String controller) =>
                      weight.weightSubmitted(controller),
                  // onChanged: (String controller) =>
                  //     weight.weightChanged(controller),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      backgroundColor: colorScheme.primary,
                      child: IconButton(
                        icon: FaIcon(
                          FontAwesomeIcons.plus,
                          color: colorScheme.surfaceVariant,
                        ),
                        onPressed: weight.increment,
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: colorScheme.primary,
                      child: IconButton(
                        icon: FaIcon(
                          FontAwesomeIcons.minus,
                          color: colorScheme.surfaceVariant,
                        ),
                        onPressed: weight.decrement,
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
