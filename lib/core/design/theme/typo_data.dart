import 'package:flutter/material.dart';

class TypoData
{

  static const _baseFamily = "Base";
  static const _baseRegular = FontWeight.normal;
  static const _baseMedium = FontWeight.w500;
  
  static const normal = TextStyle(
      fontFamily: _baseFamily,
      fontWeight: _baseRegular,
      height: 1.3);

  static const button = TextStyle(
      fontFamily: _baseFamily,
      fontWeight: _baseMedium,
      height: 1.3);

}