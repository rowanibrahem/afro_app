import 'package:afro_app/core/constants/assets_images.dart';
import 'package:afro_app/core/theme/colors.dart';
import 'package:afro_app/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _backgroundOpacity;
  late Animation<double> _secondImageOpacity;
  @override
  void initState() {
    super.initState();
    navigateToNextScreen();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3), // Adjust the duration as needed
    );

    _backgroundOpacity = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.2, curve: Curves.easeInOut),
    );

    _secondImageOpacity = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.2, 0.4, curve: Curves.easeInOut),
    );

    _controller.forward(); // Start the animations
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
// Show text after the animations complete
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // Function to navigate to the next screen
  void navigateToNextScreen() {
    Future.delayed(const Duration(seconds: 6), () {
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(builder: (context) => const OnboardingView()),
      // );
    });
  }

  @override
  Widget build(BuildContext context) {
   return ColoredBox(
    color: ColorApp.splashColor,
     child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Lottie.asset(AssetImages.animation),
          Flexible(
            child: DefaultTextStyle(
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              child: AnimatedTextKit(
                animatedTexts: [
                  WavyAnimatedText('Welcome'),
                  WavyAnimatedText('Afro Asian Board '),
                ],
                // isRepeatingAnimation: true,
                onTap: () {
                  print("Tap Event");
                },
              ),
            ),
          ),
          
        ],
      ),
   );

    // return Stack(
    //   alignment: Alignment.center,
    //   children: <Widget>[
    //     FadeTransition(
    //       opacity: _backgroundOpacity,
    //       child: SizedBox(
    //         width: MediaQuery.of(context).size.width,
    //         height: MediaQuery.of(context).size.height,
    //         child: Container(
    //           color: ColorApp.splashColor,
    //         ),
    //       ),
    //     ),
    //     // AnimatedOpacity(
    //     //   opacity: _secondImageOpacity.value,
    //     //   duration: const Duration(milliseconds: 420),
    //     //   child: Center(
    //     //     child: Padding(
    //     //       padding: const EdgeInsets.only(left: 20, right: 20),
    //     //       child: Image.asset(AssetImages.logo),
    //     //     ),
    //     //   ),
    //     // ),
    //     const SizedBox(
    //       height: 8,
    //     ),
    //   ],
    // );
  }
}
