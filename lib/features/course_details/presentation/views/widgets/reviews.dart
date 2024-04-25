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
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (context,index)=>Container(
            padding: const EdgeInsets.all(8),
            margin:  const EdgeInsets.symmetric(vertical: 8),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: CircleAvatar(
                              backgroundImage: const AssetImage(
                                'assets/images/img_5.png'
                                ),
                                radius: MediaQuery.of(context).size.width/15,
                                ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Samantha Payne",
                                style: Styles.textStyle14,
                                ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical:4),
                                child: Text(
                                  "@Sam.Payne90",
                                  style: Styles.textStyle12.copyWith(color: ColorApp.greyCart),
                                  ),
                              ),
                            ],
                          ),
                        ],
                      ),
        
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
                      direction: Axis.horizontal,
                    ),
                  ],
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
