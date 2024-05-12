import 'package:afro_app/core/theme/styles.dart';
import 'package:flutter/material.dart';


class CustomAppBarTitle extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBarTitle({super.key, this.text });
  final String? text;


  @override
  State<CustomAppBarTitle> createState() => _CustomAppBarTitleState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarTitleState extends State<CustomAppBarTitle> {


  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
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




