import 'package:afro_app/core/theme/styles.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, this.text});
  final String? text;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          // Navigator.pop(context);
        },
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.favorite_border),
          onPressed: () {
            // Implement toggle favorite functionality here
          },
        ),
      ],
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: Text(
        widget.text ?? '',
        textAlign: TextAlign.center,
        style: Styles.textStyle24,
      ),
    );
  }
}




// AppBar buildAppBar({final String? text}){
//   return AppBar(
//    leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () {
//             // Navigator.pop(context);
//           },
//         ),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.favorite_border),
//             onPressed: () {
//               // Implement toggle favorite functionality here
//             },
//           ),
//         ],
//     centerTitle: true,
//     elevation: 0,
//     backgroundColor: Colors.transparent,
//     title: Text(
//       text??'',
//       textAlign: TextAlign.center,
//       style: Styles.textStyle24,
//     ),
//   );
// }
//  // appBar: AppBar(
//         //   leading: IconButton(
//         //     icon: const Icon(Icons.arrow_back),
//         //     onPressed: () {
//         //       Navigator.push(
//         //           context,
//         //           MaterialPageRoute(
//         //               builder: (context) => const BottomNavBody()));
//         //     },
//         //   ),
        
