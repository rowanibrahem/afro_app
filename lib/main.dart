import "package:afro_app/features/splash_screen/presentation/views/splash_view.dart";
import "package:device_preview/device_preview.dart";
import "package:flutter/material.dart";

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
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        
        useMaterial3: true,
      ),
      home: const SplashView(),
    );
  }
}
