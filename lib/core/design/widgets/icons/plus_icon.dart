import 'package:devexcuses/core/design/theme/colors_data.dart';
import 'package:devexcuses/core/design/theme/dimensions_data.dart';
import 'package:flutter/material.dart';

class PlusIcon extends StatelessWidget
{

  final Color color;
  final double? size;


  const PlusIcon._internal({
    super.key,
    required this.color,
    required this.size,
  }) ;

  factory PlusIcon.appbar({
    Key? key,
    required BuildContext context,
  })
  {
    return PlusIcon._internal(
      key: key,
      color: ColorsData.mainIcon,
      size: null,
    );
  }

  factory PlusIcon.button({
    Key? key,
    required BuildContext context,
  })
  {
    return PlusIcon._internal(
      key: key,
      color: ColorsData.mainIcon,
      size: DimensionsData.defaultIconSize,
    );
  }

  @override
  Widget build(BuildContext context)
  {
    return Icon(
      Icons.add,
      color: color,
      size: size,
    );
  }

}
