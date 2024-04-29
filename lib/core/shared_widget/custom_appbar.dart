import 'package:afro_app/core/theme/styles.dart';
import 'package:flutter/material.dart';


AppBar buildAppBar({final String? text}){
  return AppBar(
   leading: const Center(
    child: Icon(Icons.arrow_back),
   ),
    centerTitle: true,
    elevation: 0,
    backgroundColor: Colors.transparent,
    title: Text(
      text??'',
      textAlign: TextAlign.center,
      style: Styles.textStyle24,
    ),
  );
}
 // appBar: AppBar(
        //   leading: IconButton(
        //     icon: const Icon(Icons.arrow_back),
        //     onPressed: () {
        //       Navigator.push(
        //           context,
        //           MaterialPageRoute(
        //               builder: (context) => const BottomNavBody()));
        //     },
        //   ),
        
