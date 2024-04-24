import 'dart:developer';

import 'package:afro_app/core/theme/colors.dart';
import 'package:afro_app/features/Favourite/presentation/views/favourite_view.dart';
import 'package:afro_app/features/card/presentation/views/card_view.dart';
import 'package:afro_app/features/home_screen/presentation/views/home_view.dart';
import 'package:afro_app/features/profile/presentation/views/profile_view.dart';
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';

class BottomNavBody extends StatefulWidget {
  const BottomNavBody({Key? key}) : super(key: key);

  @override
  State<BottomNavBody> createState() => _BottomNavBodyState();
}

class _BottomNavBodyState extends State<BottomNavBody> {
  final _pageController = PageController(initialPage: 0);

  final _controller = NotchBottomBarController(index: 0);

  int maxCount = 4;

   @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  static const List<Widget> _widgetOptions = <Widget>[
    HomeView(),
    FavouriteView(),
    CardView(),
    ProfileView(),
  ];

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: List.generate(
            _widgetOptions.length, (index) => _widgetOptions[index]),
                ),
                extendBody: true,
          bottomNavigationBar: (_widgetOptions.length <= maxCount)
            ? AnimatedNotchBottomBar(
                /// Provide NotchBottomBarController
                notchBottomBarController: _controller,
                color: Colors.white,
                showLabel: false,
                shadowElevation: 5,
                kBottomRadius: 28.0,
                // notchShader: const SweepGradient(
                //   startAngle: 0,
                //   endAngle: pi / 2,
                //   colors: [Colors.red, Colors.green, Colors.orange],
                //   tileMode: TileMode.mirror,
                // ).createShader(Rect.fromCircle(center: Offset.zero, radius: 8.0)),
                notchColor: Colors.black87,
      
                /// restart app if you change removeMargins
                removeMargins: false,
                bottomBarWidth: 500,
                showShadow: false,
                durationInMilliSeconds: 300,
                elevation: 1,
                bottomBarItems: const [
                  BottomBarItem(
                    inActiveItem: Icon(
                      Icons.home_filled,
                      color: Colors.black,
                    ),
                    activeItem: Icon(
                      Icons.home_filled,
                      color: ColorApp.primaryColor,
                    ),
                    itemLabel: 'HomeView',
                  ),
                  BottomBarItem(
                    inActiveItem: Icon(
                      Icons.star,
                      color: Colors.blueGrey,
                    ),
                    activeItem: Icon(
                      Icons.star,
                      color: Colors.blueAccent,
                    ),
                    itemLabel: 'FavouriteView',
                  ),
                  BottomBarItem(
                    inActiveItem: Icon(
                      Icons.settings,
                      color: Colors.blueGrey,
                    ),
                    activeItem: Icon(
                      Icons.settings,
                      color: Colors.pink,
                    ),
                    itemLabel: 'CardView',
                  ),
                  BottomBarItem(
                    inActiveItem: Icon(
                      Icons.person,
                      color: Colors.blueGrey,
                    ),
                    activeItem: Icon(
                      Icons.person,
                      color: Colors.yellow,
                    ),
                    itemLabel: 'ProfileView',
                  ),
                ],
                onTap: (index) {
                  /// perform action on tab change and to update pages you can update pages without pages
                  log('current selected index $index');
                  _pageController.jumpToPage(index);
                },
                kIconSize: 24.0,
              )
            : null
    );
  }
}
