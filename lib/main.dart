import "package:afro_app/bloc_observer.dart";
import "package:afro_app/constants.dart";
import "package:afro_app/core/functions/service_locator.dart";
import "package:afro_app/core/nertwork/cacheNetwork.dart";
import "package:afro_app/core/utilies/api_keys.dart";
import "package:afro_app/features/Favourite/presentation/view_model/fav_cubit.dart";
import "package:afro_app/features/authuntcation/presentation/view_model/log_in_cubit.dart";
import "package:afro_app/features/authuntcation/presentation/view_model/sign_up/sign_up_cubit.dart";
import "package:afro_app/features/course_details/presentation/view_model/course_cubit.dart";
import "package:afro_app/features/home_screen/data/home_repo_impl.dart";
import "package:afro_app/features/home_screen/presentation/view_model/courses_cubit.dart";
import "package:afro_app/features/home_screen/presentation/views/widgets/bottom_nav_body,.dart";
import "package:afro_app/features/profile/presentation/views/profile_view.dart";
import "package:afro_app/features/splash_screen/presentation/views/splash_view.dart";
import "package:afro_app/firebase_options.dart";
import "package:device_preview/device_preview.dart";
import "package:firebase_core/firebase_core.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:google_fonts/google_fonts.dart';
import "package:shared_preferences/shared_preferences.dart";

Future<void> main() async {
  setUp();
  Stripe.publishableKey = ApiKeys.publishableKey;
  WidgetsFlutterBinding.ensureInitialized();
  await CacheNetwork.cachInstialization();
final SharedPreferences prefs = await SharedPreferences.getInstance();
  token = await CacheNetwork.getCacheData(key: "token");
  name = await CacheNetwork.getCacheData(key: "name");
  var isLoggedIn = (prefs.getBool('isLoggedIn') == null)
      ? false
      : prefs.getBool('isLoggedIn');
  debugPrint("Token retrieved from cache: $token");
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Bloc.observer = MyBlocObserver();
  // final SharedPreferences prefs = await SharedPreferences.getInstance();
  // Widget homeScreen = (prefs.getBool('watched') ?? false) ? const BottomNavBody() : const SplashView();

  // ignore: cast_nullable_to_non_nullable
  // await prefs.setString('token', token!);

//remove await

  debugPrint("tokeeenn : $token");
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
            create: (ctx) => LoginCubit(),
          ),
          BlocProvider(
            create: (ctx) => SignUpCubit(),
          ),
          BlocProvider(
            create: (context) => CoursesCubit(
              getIt.get<HomeRepoImpl>(),
            )..fetchCourses(),
          ),
          BlocProvider(
            create: (context) => CoursesDetailsCubit(
              getIt.get<HomeRepoImpl>(),
            )..fetchCourseDetails(),
          ),
        //  BlocProvider(
        //     create: (context) => FavCubit(getIt.get<HomeRepoImpl>()),
        //   ),
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
          // home: ProfileView(),
          home: token != "empty" ? const BottomNavBody() : const SplashView(),
        ),
      ),
    );
  }
}
