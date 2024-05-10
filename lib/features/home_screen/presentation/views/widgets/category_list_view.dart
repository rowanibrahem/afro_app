import 'package:afro_app/core/theme/colors.dart';
import 'package:flutter/material.dart';

class CategoryListView extends StatefulWidget {
  @override
  State<CategoryListView> createState() => _CategoryListViewState();
}

class _CategoryListViewState extends State<CategoryListView> with SingleTickerProviderStateMixin  {
  TabController? tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Column(
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
                text: 'Medical',
              ),
            ],
            controller: tabController,
            indicatorSize: TabBarIndicatorSize.tab,
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
