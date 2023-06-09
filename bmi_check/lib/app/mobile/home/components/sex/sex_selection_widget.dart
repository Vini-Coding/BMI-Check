import 'package:bmi_check/app/mobile/home/components/sex/enum/sex_enum.dart';
import 'package:bmi_check/app/mobile/home/components/sex/sex_selection_widget_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class SexSelectionWidget extends StatefulWidget {
  const SexSelectionWidget({required this.sexSelected, super.key});
  final SexSelected sexSelected;

  @override
  State<SexSelectionWidget> createState() => _SexSelectionWidgetState();
}

class _SexSelectionWidgetState extends State<SexSelectionWidget> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    Color inactiveColor = colorScheme.primaryContainer;
    Color activeColor = colorScheme.primary;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //FEMININE
        ValueListenableBuilder(
          valueListenable: widget.sexSelected,
          builder: (context, value, child) {
            return GestureDetector(
              onTap: widget.sexSelected.feminine,
              child: Container(
                margin: const EdgeInsets.only(right: 15),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                height: 160,
                width: 160,
                decoration: BoxDecoration(
                  color: value == Sex.feminine ? activeColor : inactiveColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Column(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.personDress,
                        size: 80,
                        color: value == Sex.feminine
                            ? colorScheme.surface
                            : colorScheme.outline,
                      ),
                      const SizedBox(height: 14),
                      Text(
                        AppLocalizations.of(context)!.feminineSex,
                        style: textTheme.bodyMedium!.copyWith(
                          color: value == Sex.feminine
                              ? colorScheme.surface
                              : colorScheme.outline,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        //MASCULINE
        ValueListenableBuilder(
          valueListenable: widget.sexSelected,
          builder: (context, value, child) {
            return GestureDetector(
              onTap: widget.sexSelected.masculine,
              child: Container(
                margin: const EdgeInsets.only(left: 15),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                height: 160,
                width: 160,
                decoration: BoxDecoration(
                  color: value == Sex.masculine ? activeColor : inactiveColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Column(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.person,
                        size: 80,
                        color: value == Sex.masculine
                            ? colorScheme.surface
                            : colorScheme.outline,
                      ),
                      const SizedBox(height: 14),
                      Text(
                        AppLocalizations.of(context)!.masculineSex,
                        style: textTheme.bodyMedium!.copyWith(
                          color: value == Sex.masculine
                              ? colorScheme.surface
                              : colorScheme.outline,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
