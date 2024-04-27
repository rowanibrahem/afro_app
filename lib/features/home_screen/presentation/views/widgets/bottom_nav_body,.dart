import 'dart:developer';

import 'package:afro_app/core/theme/colors.dart';
import 'package:afro_app/features/Favourite/presentation/views/favourite_empty_view.dart';
import 'package:afro_app/features/cart/presentation/views/cart_empty_view.dart';
import 'package:afro_app/features/home_screen/presentation/views/home_view.dart';
import 'package:afro_app/features/profile/presentation/views/profile_view.dart';
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';

class BottomNavBody extends StatefulWidget {
  const BottomNavBody({super.key});

  @override
  State<BottomNavBody> createState() => _BottomNavBodyState();
}

class _BottomNavBodyState extends State<BottomNavBody> {
  final _pageController = PageController();

  final _controller = NotchBottomBarController();

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
            _widgetOptions.length, (index) => _widgetOptions[index],),
                ),
                extendBody: true,
          bottomNavigationBar: (_widgetOptions.length <= maxCount)
            ? AnimatedNotchBottomBar(
                /// Provide NotchBottomBarController
                notchBottomBarController: _controller,
                showLabel: false,
                shadowElevation: 5,
                kBottomRadius: 28.0,
                showShadow: false,
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
                      Icons.favorite_outline_outlined,
                      color: Colors.blueGrey,
                    ),
                    activeItem: Icon(
                      Icons.favorite_outline_outlined,
                      color: ColorApp.primaryColor,
                    ),
                    itemLabel: 'FavouriteView',
                  ),
                  BottomBarItem(
                    inActiveItem: Icon(
                      Icons.shopping_basket,
                      color: Colors.blueGrey,
                    ),
                    activeItem: Icon(
                      Icons.shopping_basket,
                      color: ColorApp.primaryColor,
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
                      color: ColorApp.primaryColor,
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
            : null,
    );
  }
}
