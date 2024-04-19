// import 'package:afro_app/features/home_screen/presentation/views/widgets/home_body.dart';
// import 'package:flutter/material.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';

// class BottomNav extends StatefulWidget {
//   const BottomNav({Key? key}) : super(key: key);

//   @override
//   State<BottomNav> createState() => _BottomNavState();
// }

// class _BottomNavState extends State<BottomNav> {
//   int _selectedIndex = 0;
//   final PageController _pageController = PageController();
//   static const List<Widget> _widgetOptions = <Widget>[
//     HomeBody(),
//     Text(
//       'Favourites',
//     ),
//     Text(
//       'Cart',
//     ),
//     Text(
//       'Profile',
//     ),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Expanded(
//           child: PageView(
//             controller: _pageController,
//             onPageChanged: (index) {
//               setState(() {
//                 _selectedIndex = index;
//               });
//             },
//             children: _widgetOptions,
//           ),
//         ),
//         Container(
//           padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
//           child: GNav(
//             selectedIndex: _selectedIndex,
//             onTabChange: (index) {
//               setState(() {
//                 _selectedIndex = index;
//                 _pageController.animateToPage(
//                   index,
//                   duration: Duration(milliseconds: 300),
//                   curve: Curves.ease,
//                 );
//               });
//             },
//             tabs: [
//               GButton(
//                 icon: Icons.home,
//                 text: 'Home',
//               ),
//               GButton(
//                 icon: Icons.favorite,
//                 text: 'Favourites',
//               ),
//               GButton(
//                 icon: Icons.card_travel_sharp,
//                 text: 'Cart',
//               ),
//               GButton(
//                 icon: Icons.person,
//                 text: 'Profile',
//               ),
//             ],
//             tabBackgroundColor: Colors.grey[800]!,
//             activeColor: Colors.white,
//             textStyle: TextStyle(color: Colors.white),
//           ),
//         ),
//       ],
//     );
//   }
// }
