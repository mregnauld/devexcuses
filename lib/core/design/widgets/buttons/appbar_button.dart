import 'package:devexcuses/core/design/theme/colors_data.dart';
import 'package:flutter/material.dart';

class AppBarButton extends StatelessWidget
{

  final Widget icone;
  final Function() onTap;
  final BuildContext? context;


  const AppBarButton._internal({
    Key? key,
    required this.icone,
    required this.onTap,
    this.context,
  }) : super(key: key);

  factory AppBarButton.defaut({
    Key? key,
    required Widget icone,
    required Function() onTap,
    BuildContext? context})
  {
    return AppBarButton._internal(
      key: key,
      icone: icone,
      onTap: onTap,
      context: context,
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: kToolbarHeight,
      height: kToolbarHeight,
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          borderRadius: BorderRadius.circular(kToolbarHeight / 2),
          highlightColor: ColorsData.splash,
          splashColor: ColorsData.splash,
          onTap: onTap,
          child: Center(child: icone),
        ),
      ),
    );
  }
}
