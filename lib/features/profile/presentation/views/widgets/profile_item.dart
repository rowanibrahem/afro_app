import 'package:flutter/material.dart';

class ProfileItem {
  final String text;
  final IconData? icon;
  final VoidCallback onTap;

  ProfileItem( {
    required this.text,
    required this.onTap,
    this.icon,
  });
}
