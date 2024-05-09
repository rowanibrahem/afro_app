import "package:afro_app/bloc_observer.dart";
import "package:afro_app/constants.dart";
import "package:afro_app/core/nertwork/cacheNetwork.dart";
import "package:afro_app/core/utilies/api_keys.dart";
import "package:afro_app/features/authuntcation/presentation/view_model/log_in_cubit.dart";
import "package:afro_app/features/splash_screen/presentation/views/splash_view.dart";
import "package:device_preview/device_preview.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
Future<void> main() async { 
  Stripe.publishableKey = ApiKeys.publishableKey;
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
  await CacheNetwork.cachInstialization();
  
//remove await
  token=  await CacheNetwork.getCacheData(key: "token");

  debugPrint("tokkkkeeeeeennnnn : $token");
  runApp(
  const MyApp(),
);
}

// void main() { 
//   Stripe.publishableKey = ApiKeys.publishableKey;
//   runApp(
//   DevicePreview(
//     builder: (BuildContext context) => const MyApp(), 
//   ),
// );
// }
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
          create: (ctx)=> LoginCubit(),
        ),
        ],
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
          home: const SplashView(),
        ),
      ),
    );
  }
}
