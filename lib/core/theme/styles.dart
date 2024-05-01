import 'package:afro_app/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: avoid_classes_with_only_static_members
abstract class Styles{
  static  TextStyle textStyle24 = TextStyle(
      color: Colors.black,
      fontSize: 24.sp,
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
    static  TextStyle textStyleNoto16 = GoogleFonts.notoSansJavanese(
    color: Colors.black,
      fontSize: 16,
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
  static  TextStyle textStyle28 = TextStyle(
      fontSize: 28.sp,
      fontWeight: FontWeight.w700,
      color: ColorApp.primaryColor,
  );
  static const textStyle18 = TextStyle(
    fontSize:18,
    fontWeight: FontWeight.w600,
  );
  
  
}
