import 'package:afro_app/core/constants/assets_icons.dart';
import 'package:afro_app/core/constants/assets_images.dart';
import 'package:afro_app/core/theme/styles.dart';
import 'package:afro_app/features/home_screen/presentation/views/widgets/category_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
     padding: const EdgeInsets.only(top: 45),
      child: Column(
        children: [
          Padding(
             padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                SvgPicture.asset(AssetIcons.profile),
                Text("Hi, Jhon Smith "),
                SvgPicture.asset(AssetIcons.emoji),
                Icon(Icons.search),
              ],
            ),
          ),
          Image.asset(AssetImages.home),
          const Text(
            "Courses",
            style: Styles.textStyleNoto16 ,
          ),
          CategoryListView(),
        ],
      ),
    );
  }
}