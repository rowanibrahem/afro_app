
import 'package:afro_app/core/theme/colors.dart';
import 'package:flutter/material.dart';

class BottomNavigationItem extends StatelessWidget {

  const BottomNavigationItem({
    required this.icon,
    required this.label,
    required this.isActive,
    required this.onTap,
  });
  final IconData icon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isActive ? Colors.black : Colors.blueGrey,
          ),
          Text(
            label,
            style: TextStyle(
              color: isActive ? ColorApp.primaryColor : Colors.blueAccent,
            ),
          ),
        ],
      ),
    );
  }
}
