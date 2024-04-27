import 'package:afro_app/core/constants/assets_icons.dart';
import 'package:afro_app/core/constants/assets_images.dart';
import 'package:afro_app/core/theme/styles.dart';
import 'package:afro_app/features/home_screen/presentation/views/widgets/category_list_view.dart';
import 'package:afro_app/features/home_screen/presentation/views/widgets/courses_item_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';



class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15 , ), //or 30
                  child: Row(
                children: [
                  SvgPicture.asset(AssetIcons.profile),
                  const SizedBox(width: 15,),
                   Text(
                    "Hi, Jhon Smith ",
                    style: Styles.textStyle14.copyWith(color: Colors.black),
                    ),
                  const SizedBox(width: 2,),
                  SvgPicture.asset(AssetIcons.emoji),
                  const Spacer(),
                  const Icon(Icons.search),
                ],
              ),
                ),
                const SizedBox(
                  height: 3,
                  ),
                Center(
                  child: Image.asset(
                    AssetImages.home,
                    ),
                    ),
             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15 , vertical: 20),
              child: Text(
                "Courses",
                style: Styles.textStyleNoto16,
              ),
            ),
            CategoryListView(),
                // const SizedBox(
                //   height: 20,
                // ),
              ],
            ),
          ),
        ),
        const SliverFillRemaining(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: CoursesItemView(),
          ),
        ),
      ],
    );
  }
}
