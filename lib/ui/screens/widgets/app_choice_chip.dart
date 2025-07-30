import 'package:bmr/ui/theme_light.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../constants/dimens_constants.dart';
import '../../model/choice_chip_item.dart';

class AppChoiceChip extends StatelessWidget {
  final List<ChoiceChipItem> choices;
  final int selectedChoice;
  final Function onSelected;
  final String title;
  final double? titleFontSize;
  final double? spaceBetweenTitleAndChip;
  final double? spaceBetweenChips;
  final double? chipTextFontSize;
  final Widget? customLabelDesign;
  final bool customLabel;

  const AppChoiceChip(
      {super.key,
      required this.choices,
      required this.selectedChoice,
      required this.onSelected,
      required this.title,
      this.titleFontSize,
      this.chipTextFontSize,
      this.customLabel = false,
      this.customLabelDesign,
      this.spaceBetweenTitleAndChip,
      this.spaceBetweenChips});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Gap(spaceBetweenTitleAndChip ?? DimensConstants.screenPadding),
        Wrap(
          children: List<Widget>.generate(
            choices.length,
            (int index) {
              return Padding(
                padding: EdgeInsets.only(
                    right: spaceBetweenChips ?? 10.0,
                    bottom: customLabel ? 10 : 10),
                child: ChoiceChip(
                  showCheckmark: false,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  selectedColor: primaryColor,
                  backgroundColor: Colors.white,
                  elevation: 2,
                  side: WidgetStateBorderSide.resolveWith((states) {
                    if (states.contains(WidgetState.selected)) {
                      return BorderSide(color: primaryColor, width: 1.5);
                    }
                    return const BorderSide(color: Colors.white);
                  }),
                  label: Text(choices[index].title),
                  labelStyle: TextStyle(
                      color: WidgetStateColor.resolveWith((states) {
                        if (states.contains(WidgetState.selected)) {
                          return Colors.white;
                        }
                        return primaryColor;
                      }),
                      fontSize: chipTextFontSize ?? 14),
                  selected: selectedChoice == index ? true : false,
                  onSelected: (bool selected) {
                    onSelected(index);
                  },
                ),
              );
            },
          ).toList(),
        ),
      ],
    );
  }
}
