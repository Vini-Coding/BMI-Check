import 'package:flutter/material.dart';

class GeneralButtonWidget extends StatefulWidget {
  const GeneralButtonWidget({
    required this.text,
    required this.onPressed,
    super.key,
  });
  final Function() onPressed;
  final String text;

  @override
  State<GeneralButtonWidget> createState() => _GeneralButtonWidgetState();
}

class _GeneralButtonWidgetState extends State<GeneralButtonWidget> {
  bool onPressed = false;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Container(
      height: 70,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: onPressed ? colorScheme.secondary : colorScheme.primary,
        borderRadius: BorderRadius.circular(50),
      ),
      child: TextButton(
        
        onPressed: widget.onPressed,
        child: Text(
          widget.text,
          style: textTheme.labelMedium,
        ),
      ),
    );
  }
}
