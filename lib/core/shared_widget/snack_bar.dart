import 'package:flutter/material.dart';

SnackBar customSnackBar({
  required String message,
}){
  return SnackBar(
    content: Container(
        alignment: Alignment.center,
        height: 40,
        child: Text(message,
          style: const TextStyle(
              fontSize: 16,
          ),
        ),
    ),
  );
}
