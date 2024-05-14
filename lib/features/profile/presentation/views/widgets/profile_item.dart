import 'package:flutter/material.dart';

class ProfileItem {

  ProfileItem( {
    required this.text,
    required this.onTap,
    this.icon,
  });
  final String text;
  final IconData? icon;
  final VoidCallback onTap;
}
