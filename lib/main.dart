import "package:afro_app/features/authuntcation/presentation/views/log_in_view.dart";
import "package:afro_app/features/home_screen/presentation/views/home_view.dart";
import "package:afro_app/features/on_boarding/presentation/views/on_boarding_view.dart";
import "package:afro_app/features/splash_screen/presentation/views/splash_view.dart";
import "package:device_preview/device_preview.dart";
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}
// void main() => runApp(
  
//   DevicePreview(
//     builder: (BuildContext context) => const MyApp(), // Wrap your app
//   ),
// );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        textTheme: GoogleFonts.josefinSansTextTheme(),
        useMaterial3: true,
      ),
      home: const SplashView(),
    );
  }
}
