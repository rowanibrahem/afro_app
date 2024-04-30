// ignore_for_file: prefer_const_constructors

import 'package:afro_app/core/constants/assets_icons.dart';
import 'package:afro_app/core/constants/assets_images.dart';
import 'package:afro_app/core/theme/colors.dart';
import 'package:afro_app/core/theme/styles.dart';
import 'package:afro_app/features/authuntcation/presentation/views/log_in_view.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class OnboardingBody extends StatefulWidget {
  const OnboardingBody({super.key});

  @override
  State<OnboardingBody> createState() => _OnboardingBodyState();
}

class _OnboardingBodyState extends State<OnboardingBody>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _animation = Tween<Offset>(
      begin: const Offset(0, -1), // Start from above
      end: const Offset(0, 0), // End at the original position
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
    _controller.forward(); // Start the animation
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 3,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                         begin: Alignment.bottomCenter,
                         end: Alignment.topCenter,
                        colors: [
                        ColorApp.primaryColor,
                        Colors.white,
                       
                    ],
                    ),  
    
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(50)),),
              child: Column(
                children: [
                  Expanded(
                    child: 
                    // AnimatedPositioned(
                    //    duration: const Duration(seconds: 1),
                    //     top: 0, // Position from the top
                    //     left: 0, // Position from the left
                    //     right: 0,
    
                    //   child: 
                      SlideTransition(
                        position: _animation,
                        child: Image.asset(
                          AssetImages.book, 
                          // fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ],
              ),
            ),),
        Expanded(
            flex: 2,
            child: Container(
              color: ColorApp.primaryColor,
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                    ),),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Spacer(),
                      Text(
                        "Learning everything",
                        style: Styles.textStyle24.copyWith(fontSize: 29),
                      ),
                      Spacer(),
                      Text(
                        "Learn with pleasure with\nus,where you are!",
                        textAlign: TextAlign.center,
                        style: Styles.textStyle24.copyWith(fontSize: 20),
                      ),
                      Spacer(
                        flex: 3,
                      ),
                      //repleace sizebox with spacer
                      Row(
                        //button position
                       mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                           GestureDetector(
                            onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginView(),
                                  ),
                                );
                              },
    
                             child: SvgPicture.asset(
                                  AssetIcons.bottonStart,
                                ),
                           ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),),
      ],
    );
  }
}





// import 'package:afro_app/core/constants/assets_icons.dart';
// import 'package:afro_app/core/constants/assets_images.dart';
// import 'package:afro_app/core/theme/colors.dart';
// import 'package:afro_app/features/authuntcation/presentation/views/log_in_view.dart';
// import 'package:afro_app/features/home_screen/presentation/views/home_view.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

// class OnboardingBody extends StatefulWidget {
//   const OnboardingBody({Key? key}) : super(key: key);

//   @override
//   State<OnboardingBody> createState() => _OnboardingBodyState();
// }

// class _OnboardingBodyState extends State<OnboardingBody>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<Offset> _animation;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(seconds: 1),
//       vsync: this,
//     );
//     _animation = Tween<Offset>(
//       begin: const Offset(0, -1), // Start from above
//       end: const Offset(0, 0), // End at the original position
//     ).animate(
//       CurvedAnimation(
//         parent: _controller,
//         curve: Curves.easeInOut,
//       ),
//     );
//     _controller.forward(); // Start the animation
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Column(
//           children: [
//             Expanded(
//               flex: 3,
//               child: Container(
//                 width: double.infinity,
//                 decoration: const BoxDecoration(
//                   gradient: LinearGradient(
//                          begin: Alignment.bottomCenter,
//                          end: Alignment.topCenter,
//                         colors: [
//                         ColorApp.primaryColor,
//                         Colors.white,
                       
//                     ],
//                     ),  
//                   borderRadius: BorderRadius.only(
//                     bottomRight: Radius.circular(50),
//                   ),
//                 ),
//                 child: Column(
//                   children: [
//                     Expanded(
//                       child: AnimatedPositioned(
//                         duration: const Duration(seconds: 1),
//                         top: 0, // Position from the top
//                         left: 0, // Position from the left
//                         right: 0,
//                         child: SlideTransition(
//                           position: _animation,
//                           child: Image.asset(
//                             AssetImages.book, // Replace with your photo asset path
//                             fit: BoxFit.fill,
//                           ),
//                         ),
//                       ),
//                     ),
//                     const Text(
//                       "Afro Asian Board",
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Expanded(
//               flex: 2,
//               child: Container(
//                 color: ColorApp.primaryColor,
//                 child: Container(
//                   width: double.infinity,
//                   decoration: const BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(50),
//                     ),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(15.0),
//                     child: Column(
//                       children: [
//                         Spacer(),
//                         Text(
//                           "Learning everything",
//                           style: TextStyle(
//                             fontSize: 28,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         Spacer(),
//                         Text(
//                           "Learn with pleasure with\nus,where you are!",
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             color: Colors.black54,
//                             wordSpacing: 2.5,
//                             height: 1.5,
//                             fontSize: 16,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                         Spacer(
//                           flex: 3,
//                         ),
//                         //repleace sizebox with spacer
//                         Row(
//                           //button position
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             GestureDetector(
//                               onTap: () {
//                                 Navigator.pushReplacement(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) => const HomeView(),
//                                   ),
//                                 );
//                               },
//                               child: SvgPicture.asset(
//                                 AssetIcons.bottonStart,
//                               ),
//                             ),
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }





















// import 'package:afro_app/core/constants/assets_icons.dart';
// import 'package:afro_app/core/constants/assets_images.dart';
// import 'package:afro_app/core/theme/colors.dart';
// import 'package:afro_app/features/home_screen/presentation/views/home_view.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// class OnboardingBody extends StatefulWidget {
//   const OnboardingBody({Key? key}) : super(key: key);


//   @override
//   State<OnboardingBody> createState() => _OnboardingBodyState();
// }

// class _OnboardingBodyState extends State<OnboardingBody> with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<Offset> _animation;
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(seconds: 1),
//       vsync: this,
//     );
//     _animation = Tween<Offset>(
//       begin: const Offset(0, -1), // Start from above
//       end: const Offset(0, 0),    // End at the original position
//     ).animate(
//       CurvedAnimation(
//         parent: _controller,
//         curve: Curves.easeInOut,
//       ),
//     );
//     _controller.forward(); // Start the animation
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: SizedBox(
//         width: MediaQuery.of(context).size.width,
//         height: MediaQuery.of(context).size.height  /1.53,
//         child: Stack(
//           children: [
//             Stack(
//               children: [
//                 Container(
//                   width: MediaQuery.of(context).size.width,
//                   height: MediaQuery.of(context).size.height /1.53,
//                   decoration: const BoxDecoration(
//                     color: Colors.white,
//                   ),
//                 ),
//                 Container(
//                   width: MediaQuery.of(context).size.width,
//                   height: MediaQuery.of(context).size.height / 1.53,
//                   decoration: const BoxDecoration(
//                     gradient: LinearGradient(
//                      begin: Alignment.bottomCenter,
//                      end: Alignment.topCenter,
//                     colors: [
//                     ColorApp.primaryColor,
//                     Colors.white,
                   
//                 ],
//                 ), 
//                     borderRadius: BorderRadius.only(
//                       bottomRight: Radius.circular(70),
//                     ),
//                   ),
//                   child: Column(
//                     children: [
//                       AnimatedPositioned(
//               duration: const Duration(seconds: 1),
//               top: 0,  // Position from the top
//               left: 0, // Position from the left
//               right: 0,
//               child: SlideTransition(
//                 position: _animation,
//                 child: Image.asset(
//                    AssetImages.book, // Replace with your photo asset path
//                   fit: BoxFit.fill,
//                 ),
//               ),
//             ),

//                       const Text(
//                         "Afro Asian Board",
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
            
//             Align(
//               alignment: Alignment.bottomCenter,
//               child: Container(
//                 width: MediaQuery.of(context).size.width,
//                 height: MediaQuery.of(context).size.height / 2.88,
//                 decoration: const BoxDecoration(
//                    gradient: LinearGradient(
//                      begin: Alignment.bottomCenter,
//                      end: Alignment.topCenter,
//                     colors: [
//                     ColorApp.primaryColor,
//                     Colors.white,
                   
//                 ],
//                 ), 
//                 ),
//               ),
//             ),
//             Align(
//               alignment: Alignment.bottomCenter,
//               child: Container(
//                 width: MediaQuery.of(context).size.width,
//                 height: MediaQuery.of(context).size.height / 2.88,
//                 padding: const EdgeInsets.only(top: 30, bottom: 20),
//                 decoration: const BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(70),
//                   ),
//                 ),
//                 child: Column(
//                   children: [
//                     Text(
//                       'Learning is everything',
//                       style: Theme.of(context).textTheme.headlineSmall,
//                     ),
//                     const SizedBox(
//                       height: 15,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 40),
//                       child: Text(
//                         "Learning with pleasure with us , Where ever you are ",
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           fontSize: 17,
//                           color: Colors.black.withOpacity(.6),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 60,
//                     ),
//                     GestureDetector(
//                       onTap: (){
//                         Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const HomeView()),);
//                       },
//                       child: SvgPicture.asset(
//                         AssetIcons.bottonStart,
//                         ),
//                       ), 
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// ignore_for_file: prefer_const_constructors



