import 'package:devexcuses/core/design/theme/colors_data.dart';
import 'package:devexcuses/core/design/theme/dimensions_data.dart';
import 'package:devexcuses/core/design/theme/typo_data.dart';
import 'package:devexcuses/core/design/widgets/text/styled_text.dart';
import 'package:flutter/material.dart';

class IconTextButton extends StatelessWidget
{

  final Widget icon;
  final String label;
  final Function() onTap;
  final Color backgroundColor;
  final Color labelColor;
  final double cornerRadius;


  const IconTextButton._internal({
    Key? key,
    required this.icon,
    required this.label,
    required this.onTap,
    required this.backgroundColor,
    required this.labelColor,
    required this.cornerRadius,
  }) : super(key: key);

  factory IconTextButton.defaut({
    Key? key,
    required Widget icon,
    required String label,
    required BuildContext context,
    required Function() onTap})
  {
    return IconTextButton._internal(
      key: key,
      icon: icon,
      label: label,
      onTap: onTap,
      backgroundColor: ColorsData.buttonBackground,
      labelColor: ColorsData.mainText,
      cornerRadius: DimensionsData.buttonCornerRadius,
    );
  }
  
  @override
  Widget build(BuildContext context)
  {
    return Material(
      borderRadius: BorderRadius.circular(cornerRadius),
      color: backgroundColor,
      child: InkWell(
        borderRadius: BorderRadius.circular(cornerRadius),
        onTap: onTap,
        highlightColor: ColorsData.splash,
        splashColor: ColorsData.splash,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: DimensionsData.buttonHorizontalPadding,
            vertical: DimensionsData.buttonVerticalPadding,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              icon,
              const SizedBox(width: 12),
              Flexible(
                child: StyledText(
                  label,
                  color: labelColor,
                  typo: TypoData.button,
                  fontSize: DimensionsData.buttonTextSize,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
}
