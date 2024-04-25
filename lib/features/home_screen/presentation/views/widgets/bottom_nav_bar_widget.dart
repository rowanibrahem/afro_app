import 'package:afro_app/features/home_screen/presentation/views/widgets/bottom_nav_item.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarWidget extends StatelessWidget {

  const BottomNavigationBarWidget({required this.items});
  final List<BottomNavigationItem> items;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: items,
    );
  }
}
