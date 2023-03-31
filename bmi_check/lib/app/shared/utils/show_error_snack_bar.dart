import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void showErrorSnackBar({
  required BuildContext context,
  required String exceptionText,
}) {
  TextTheme textTheme = Theme.of(context).textTheme;
  ColorScheme colorScheme = Theme.of(context).colorScheme;
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      padding: const EdgeInsets.all(0),
      content: Container(
        height: 50,
        width: double.maxFinite,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: colorScheme.error,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            const SizedBox(width: 10),
            FaIcon(
              FontAwesomeIcons.circleExclamation,
              color: colorScheme.onError,
              size: 20,
            ),
            const SizedBox(width: 20),
            Text(
              exceptionText.toString(),
              style: textTheme.bodyMedium!
                  .copyWith(color: colorScheme.onError, fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      behavior: SnackBarBehavior.floating,
      dismissDirection: DismissDirection.horizontal,
      backgroundColor: Colors.transparent,
      elevation: 0,

    ),
  );
}
