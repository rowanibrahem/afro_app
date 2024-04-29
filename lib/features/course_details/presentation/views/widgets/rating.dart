import 'package:afro_app/core/constants/assets_icons.dart';
import 'package:afro_app/core/constants/assets_images.dart';
import 'package:afro_app/core/theme/colors.dart';
import 'package:afro_app/core/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Rating extends StatefulWidget {
  const Rating({super.key});

  @override
  State<Rating> createState() => _RatingState();
}

class _RatingState extends State<Rating> {
  List<bool> isMore=[false,false,false];
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,   
      children: [
        const Padding(
          padding: EdgeInsets.only(right: 8.0),
          child: CircleAvatar(
            backgroundImage: AssetImage(
             AssetImages.profile,
              ),
              // radius: MediaQuery.of(context).size.width/15,
              ),
        ),
        const Text(
          "Samantha Payne",
          style: Styles.textStyle14,
          ),
        RatingBarIndicator(
          unratedColor: Colors.grey[300],
          rating: 4.5,
          itemBuilder: (context, index) => const Icon(
            Icons.star,
            color: ColorApp.primaryColor,
          ),
          itemCount: 5,
          itemSize: MediaQuery.of(context).size.width/15,
        ),
      ],
    );
  }
}