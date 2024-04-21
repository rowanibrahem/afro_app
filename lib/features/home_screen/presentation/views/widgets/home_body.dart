import 'package:afro_app/core/constants/assets_icons.dart';
import 'package:afro_app/core/constants/assets_images.dart';
import 'package:afro_app/core/theme/styles.dart';
import 'package:afro_app/features/home_screen/presentation/views/widgets/category_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                SvgPicture.asset(AssetIcons.profile),
                const Text("Hi, Jhon Smith "),
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
        ],
      ),
    );
  }
}
