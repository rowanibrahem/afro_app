import 'package:afro_app/core/theme/colors.dart';
import 'package:afro_app/features/home_screen/presentation/views/widgets/courses_item_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CategoryListView extends StatefulWidget {
  @override
  State<CategoryListView> createState() => _CategoryListViewState();
}

class _CategoryListViewState extends State<CategoryListView> with SingleTickerProviderStateMixin  {
  TabController? tabController;
  List<String> tags = ['All', 'programming', 'IT'];

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisSize: MainAxisSize.min,
        children: [
          TabBar(
            indicatorColor: ColorApp.primaryColor,
            unselectedLabelColor: Colors.black,
            labelColor: ColorApp.primaryColor,
            tabs: const [
              Tab(
                text: 'All',
              ),
              Tab(
                text: 'Programing',
              ),
              Tab(
                text: 'IT',
              ),
            ],
            controller: tabController,
            indicatorSize: TabBarIndicatorSize.tab,
          ),
          SizedBox(
           width: 500,
           height: 500,
            child: TabBarView(
              controller: tabController,
              children: tags.map((tag) {
                
                return CoursesItemView(selectedTag: tag == 'All' ? null : tag);
              }).toList(),
            ),
          ),
          // Expanded(
          //   child: TabBarView(
          //     controller: tabController,
          //     children: const [
          //       Center(
          //         child: Text(
          //           'Screen 1',
          //         ),
          //       ),
          //       Center(
          //         child: Text(
          //           'Screen 2',
          //         ),
          //       ),
          //       Center(
          //         child: Text(
          //           'Screen 3',
          //         ),
          //       ),
          //       Center(
          //         child: Text(
          //           'Screen 4',
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ],
    );
  }
}
