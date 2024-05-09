 import 'package:afro_app/core/theme/colors.dart';
import 'package:afro_app/core/theme/styles.dart';
import 'package:flutter/material.dart';

Widget buildListItem(String text, Widget leadingWidget) {
    return ListTile(
      leading: SizedBox(
      width: 24,
      height: 24,
      child: leadingWidget,
    ),
      title: Text(
        text,
        style: Styles.textStyle18.copyWith(color: ColorApp.greyCart , fontSize: 15),
        ),
    );
  }
