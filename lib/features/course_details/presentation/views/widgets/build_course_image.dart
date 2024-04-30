import 'package:afro_app/core/constants/assets_images.dart';
import 'package:afro_app/core/theme/styles.dart';
import 'package:afro_app/features/course_details/presentation/views/widgets/list_view_items_learn.dart';
import 'package:afro_app/features/course_details/presentation/views/widgets/rating.dart';
import 'package:flutter/material.dart';

Widget buildCourseImageAndDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          AssetImages.courseDetails,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 25),
        Text(
          'Learn web development',
          style: Styles.textStyleNoto16.copyWith(fontSize: 20),
        ),
         const SizedBox(height: 25),
        const Rating(),
        const SizedBox(height: 25),
        Text(
          'OverView',
          style: Styles.textStyleNoto16.copyWith(fontSize: 20),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          'Lorem ipsum dolor sit amet consectetur.Purus pulvinar eget in molestie aenean metus tortor. Odio eget urna odio mauris.',
          style: Styles.textStyle12,
        ),
        const SizedBox(height: 40),
        Text(
          'What will you learn',
          style: Styles.textStyleNoto16.copyWith(fontSize: 20),
        ),
        const SizedBox(height: 10),
        buildListViewCourse(),
        const SizedBox(
          height: 30,
        ),
        Text(
          'EGP 1,999.99',
          style: Styles.textStyle16.copyWith(fontSize: 20),
        ),
      ],
    );
  }