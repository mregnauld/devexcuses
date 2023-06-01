import 'package:devexcuses/core/design/theme/colors_data.dart';
import 'package:devexcuses/core/design/theme/dimensions_data.dart';
import 'package:devexcuses/core/design/theme/typo_data.dart';
import 'package:flutter/material.dart';

class StyledText extends StatelessWidget
{
  
  final String text;
  final TextAlign textAlign;
  final TextStyle? typo;
  final Color? color;
  final double? fontSize;
  final int? maxLines;
  
  
  const StyledText( this.text, {
    super.key,
    this.textAlign = TextAlign.start,
    this.typo,
    this.color,
    this.fontSize,
    this.maxLines,
  });
  
  @override
  Widget build(BuildContext context)
  {
    final fontSize = this.fontSize ?? DimensionsData.defaultFontSize;
    return Transform.translate(
      offset: Offset(0, - 0.2 - fontSize * 0.08),
      child: Text(
        text,
        textAlign: textAlign,
        maxLines: maxLines,
        style: (typo ?? TypoData.normal).copyWith(
          color: color ?? ColorsData.mainText,
          fontSize: fontSize,
        ),
      ),
    );
  }
  
}
