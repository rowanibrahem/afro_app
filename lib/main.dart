import "package:afro_app/core/utilies/api_keys.dart";
import "package:afro_app/features/course_details/presentation/views/course_view.dart";
import "package:afro_app/features/home_screen/presentation/views/bottom_nav_view.dart";
import "package:afro_app/features/home_screen/presentation/views/widgets/bottom_nav_body,.dart";
import "package:afro_app/features/payment/presentation/views/cart_view.dart";
import "package:device_preview/device_preview.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:google_fonts/google_fonts.dart';

void main() { 
  Stripe.publishableKey = ApiKeys.publishableKey;
  runApp(
  DevicePreview(
    builder: (BuildContext context) => const MyApp(), 
  ),
);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // ignore: deprecated_member_use
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          textTheme: GoogleFonts.josefinSansTextTheme(),
          useMaterial3: true,
        ),
        home: const BottomNavBody(),
      ),
    );
  }
}
