 import 'package:flutter/material.dart';

Widget buildListItem(String text, Widget leadingWidget) {
    return ListTile(
      leading: SizedBox(
      width: 24,
      height: 24,
      child: leadingWidget,
    ),
      title: Text(text),
    );
  }