import 'package:afro_app/core/theme/colors.dart';
import 'package:flutter/material.dart';

abstract class Styles{
  static const TextStyle textStyle24 = TextStyle(
      color: Colors.black,
      fontSize: 24,
      fontWeight: FontWeight.w600,//semibold
  );
  static const TextStyle textStyle16 = TextStyle(
      color: Colors.black,
      fontSize: 16,
      fontWeight: FontWeight.w700,
  );
  static const TextStyle textStyle14 = TextStyle(
      color: ColorApp.categoriesColor,
      fontSize: 14,
      fontWeight: FontWeight.w600,
  );
  static const TextStyle textStyle36 = TextStyle(
      color: Colors.black,
      fontSize: 36,
      fontWeight: FontWeight.w700,
  );
    static const TextStyle textStyleNoto16 = TextStyle(
      color: Colors.black,
      fontSize: 16,
      fontFamily: 'Noto Sans Javanese',
      fontWeight: FontWeight.w700,//bold
  );
  static const TextStyle textStyle12 = TextStyle(
      color: Colors.black,
      fontSize: 12,
      fontWeight: FontWeight.w400, //regular
  );
  static const TextStyle textStyleLight12 = TextStyle(
      color: Colors.black,
      fontSize: 12,
      fontWeight: FontWeight.w300, //light
  );
  
}
