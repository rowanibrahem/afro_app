import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class PayListItem extends StatelessWidget {
  const PayListItem({super.key, required this.isActive, required this.image});
 final bool isActive;
 final String image;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: 103,
      height: 62,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1.50,
            color: isActive ? const Color(0xFF34A853) : Colors.grey,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        shadows: [
          BoxShadow(
            color: isActive ? const Color(0xFF34A853) : Colors.grey,
            blurRadius: 4,
          ),
        ],
      ),
     child : Container(
       decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(15), color: Colors.white,
       ),
       child : Center(
         child : SvgPicture.asset(
           image,
         ),
       ),
     ),
    );
  }
}
