import 'package:afro_app/core/constants/assets_icons.dart';
import 'package:afro_app/core/constants/assets_images.dart';
import 'package:afro_app/core/theme/styles.dart';
import 'package:afro_app/features/home_screen/presentation/views/widgets/category_list_view.dart';
import 'package:afro_app/features/home_screen/presentation/views/widgets/courses_item_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';



class HomeBody extends StatelessWidget {
  const HomeBody({super.key, this.userName = "Rowan"});
  final String userName;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 10, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Padding(
                 padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
                  child: Row(
                children: [
                  Image.asset( 
                    AssetImages.profile,
                     width: 40, 
                     height: 40,
                    ),
                  const SizedBox(width: 15,),
                   Text(
                    "Hi, $userName",
                    style: Styles.textStyle14.copyWith(color: Colors.black),
                    ),
                  const SizedBox(width: 2,),
                  SvgPicture.asset(AssetIcons.emoji),
                  const Spacer(),
                  Image.asset(
                    AssetImages.logo,
                    width: 50,
                    height: 50,
                  ),
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
                    const SizedBox(
                  height: 20,
                ),
             Text(
               "Courses",
               style: Styles.textStyleNoto16,
             ),
            CategoryListView(),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
        // const SliverFillRemaining(
        //   child: Padding(
        //     padding: EdgeInsets.symmetric(horizontal: 30),
        //     child: CoursesItemView(),
        //   ),
        // ),
      ],
    );
  }
}
