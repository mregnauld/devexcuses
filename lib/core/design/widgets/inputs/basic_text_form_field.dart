import 'package:devexcuses/core/design/theme/colors_data.dart';
import 'package:devexcuses/core/design/theme/dimensions_data.dart';
import 'package:devexcuses/core/design/theme/typo_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BasicTextFormField extends StatelessWidget
{

  final BuildContext? context;
  final TextEditingController controller;
  final String hintText;
  final int maxLength;
  final bool estPassword;
  final TextCapitalization textCapitalization;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final bool autoFocus;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String saisie)? onChanged;
  final Function(String saisie)? onFieldSubmitted;
  final FocusNode? focusNode;
  final TextAlign textAlign;
  final double? fontSize;
  final Widget? suffixIcon;


  const BasicTextFormField({
    Key? key,
    required this.hintText,
    required this.maxLength,
    required this.controller,
    this.context,
    this.estPassword = false,
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.autoFocus = false,
    this.validator,
    this.inputFormatters,
    this.onChanged,
    this.onFieldSubmitted,
    this.focusNode,
    this.textAlign = TextAlign.start,
    this.fontSize,
    this.suffixIcon,
  }) : assert(maxLength > 0),
       super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return TextFormField(
      focusNode: focusNode,
      textAlign: textAlign,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(DimensionsData.inputCornerRadius),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(DimensionsData.inputCornerRadius),
        ),
        contentPadding: const EdgeInsets.fromLTRB(24, 14, 24, 16),
        fillColor: ColorsData.inputBackground,
        filled: true,
        counterText: "",
        hintText: hintText,
        hintMaxLines: 1,
        hintStyle: TypoData.normal.copyWith(
          color: ColorsData.hintText,
          fontSize: fontSize ?? DimensionsData.defaultFontSize,
        ),
        suffixIcon: suffixIcon,
      ),
      style: TypoData.normal.copyWith(
        color: ColorsData.mainText,
        fontSize: fontSize ?? DimensionsData.defaultFontSize,
      ),
      controller: controller,
      autofocus: autoFocus,
      cursorColor: ColorsData.textCursor,
      cursorWidth: 2,
      textAlignVertical: TextAlignVertical.bottom,
      obscureText: estPassword,
      textCapitalization: textCapitalization,
      textInputAction: textInputAction,
      keyboardType: textInputType,
      maxLength: maxLength,
      minLines: 1,
      maxLines: 1,
      validator: validator,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      inputFormatters: inputFormatters,
    );
  }

}
