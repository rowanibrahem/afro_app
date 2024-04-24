import 'package:afro_app/features/home_screen/presentation/views/widgets/bottom_nav_item.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final List<BottomNavigationItem> items;

  const BottomNavigationBarWidget({required this.items});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: items,
    );
  }
}
