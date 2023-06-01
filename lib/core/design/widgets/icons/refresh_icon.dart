import 'package:devexcuses/core/design/theme/colors_data.dart';
import 'package:devexcuses/core/design/theme/dimensions_data.dart';
import 'package:flutter/material.dart';

class RefreshIcon extends StatelessWidget
{
  
  final Color color;
  final double? size;
  

  const RefreshIcon._internal({
    super.key,
    required this.color,
    required this.size,
  }) ;

  factory RefreshIcon.button({
    Key? key,
    required BuildContext context,
  })
  {
    return RefreshIcon._internal(
      key: key,
      color: ColorsData.mainIcon,
      size: DimensionsData.defaultIconSize,
    );
  }

  @override
  Widget build(BuildContext context)
  {
    return Icon(
      Icons.refresh_rounded,
      color: color,
      size: size,
    );
  }
  
}
