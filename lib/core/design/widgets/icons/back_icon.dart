import 'dart:io';
import 'package:devexcuses/core/design/theme/colors_data.dart';
import 'package:flutter/material.dart';

class BackIcon extends StatelessWidget
{

  final Color color;
  final double? size;


  const BackIcon._internal({
    super.key,
    required this.color,
    required this.size,
  }) ;

  factory BackIcon.appbar({
    Key? key,
    required BuildContext context,
  })
  {
    return BackIcon._internal(
      key: key,
      color: ColorsData.mainIcon,
      size: null,
    );
  }

  @override
  Widget build(BuildContext context)
  {
    if (Platform.isAndroid)
    {
      return Icon(
        Icons.arrow_back_sharp,
        color: color,
        size: size,
      );
    }
    else
    {
      return Icon(
        Icons.arrow_back_ios_sharp,
        color: color,
        size: size,
      );
    }
  }

}
