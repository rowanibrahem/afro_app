import 'package:afro_app/core/constants/assets_icons.dart';
import 'package:afro_app/core/constants/assets_images.dart';
import 'package:afro_app/core/theme/styles.dart';
import 'package:afro_app/features/home_screen/presentation/views/widgets/courses_item_view.dart';
import 'package:afro_app/features/home_screen/presentation/views/widgets/category_list_view.dart';
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
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15 , ), //or 30
                  child: Row(
                children: [
                  SvgPicture.asset(AssetIcons.profile),
                  SizedBox(width: 15,),
                  const Text("Hi, Jhon Smith "),
                  SizedBox(width: 2,),
                  SvgPicture.asset(AssetIcons.emoji),
                  const Icon(Icons.search),
                ],
              ),
                ),
                Center(child: Image.asset(AssetImages.home)),
            const Padding(
               padding: EdgeInsets.symmetric(horizontal: 15),
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
