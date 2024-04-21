import 'package:afro_app/core/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


AppBar buildAppBar({final String? text}){
  return AppBar(
   leading: const Center(
    child: Icon(Icons.arrow_back),
  //  child: SvgPicture.asset(
  //    'assets/icons/Arrow 1.svg',
  //  ),
   ),
    centerTitle: true,
    elevation: 0,
    backgroundColor: Colors.transparent,
    title: Text(
      text??'',
      textAlign: TextAlign.center,
      style: Styles.textStyle24,
    ),
  );
}
