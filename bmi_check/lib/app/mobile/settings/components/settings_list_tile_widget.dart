import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingsListTileWidget extends StatelessWidget {
  const SettingsListTileWidget({
    required this.icon,
    required this.title,
    required this.onTap,
    super.key,
  });
  final IconData icon;
  final String title;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        title: Text(
          title,
          style: textTheme.bodyMedium!.copyWith(fontSize: 20),
        ),
        leading: FaIcon(
          icon,
          color: colorScheme.primary,
          size: 23,
        ),
        trailing: FaIcon(
          FontAwesomeIcons.chevronRight,
          color: colorScheme.outline,
          size: 19,
        ),
        onTap: onTap,
      ),
    );
  }
}
