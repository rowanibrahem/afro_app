 import 'package:afro_app/core/constants/assets_icons.dart';
import 'package:afro_app/core/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void showAddToCartPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return 
        AlertDialog(
          elevation: 20, 
          content: Container(
            decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  AssetIcons.popUp,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Added to cart successfully!! ',
                  style: Styles.textStyle24,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
