import 'package:bmi_check/app/mobile/home/components/age/age_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AgeWidget extends StatefulWidget {
  const AgeWidget({required this.age, super.key});
  final AgeController age;

  @override
  State<AgeWidget> createState() => _AgeWidgetState();
}

class _AgeWidgetState extends State<AgeWidget> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return ValueListenableBuilder(
      valueListenable: widget.age,
      builder: (context, value, child) {
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
                  'Age',
                  style: textTheme.bodyMedium,
                ),
                TextField(
                  controller: widget.age.ageTextField,
                  keyboardType: TextInputType.number,
                  style: textTheme.displayLarge!.copyWith(fontSize: 44),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: value.toInt().toString(),
                    hintStyle: textTheme.displayLarge!.copyWith(fontSize: 44),
                  ),
                  onSubmitted: (String controller) =>
                      widget.age.ageSubmitted(controller),
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
                        onPressed: widget.age.decrement,
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: colorScheme.primary,
                      child: IconButton(
                        icon: FaIcon(
                          FontAwesomeIcons.plus,
                          color: colorScheme.surfaceVariant,
                        ),
                        onPressed: widget.age.increment,
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
