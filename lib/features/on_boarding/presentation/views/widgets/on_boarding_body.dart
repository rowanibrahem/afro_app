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
      duration: const Duration(seconds: 3),
      vsync: this,
    );
    _animation = Tween<Offset>(
      begin: const Offset(0, -1), // Start from above
      // ignore: use_named_constants
      end:   const Offset(0, 0), // End at the original position
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
            child: ColoredBox(
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
                      const Spacer(),
                      Text(
                        "Learning everything",
                        style: Styles.textStyle24.copyWith(fontSize: 29),
                      ),
                      const Spacer(),
                      Text(
                        "Learn with pleasure with\nus,where you are!",
                        textAlign: TextAlign.center,
                        style: Styles.textStyle24.copyWith(fontSize: 20),
                      ),
                      const Spacer(
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
