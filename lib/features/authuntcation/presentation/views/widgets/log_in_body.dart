import 'package:afro_app/features/authuntcation/presentation/views/widgets/back_ground.dart';
import 'package:afro_app/features/authuntcation/presentation/views/widgets/login_fields.dart';
import 'package:afro_app/features/authuntcation/presentation/views/widgets/logo_top.dart';
import 'package:afro_app/features/authuntcation/presentation/views/widgets/welcome_text.dart';
import 'package:flutter/material.dart';



class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}


class _LoginBodyState extends State<LoginBody> {
 @override
Widget build(BuildContext context) {
  
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Expanded(
        child: Stack(
          children: [
            BackgroundContainer(),
           const  LogoTop(),
            const WelcomeText(
              welcomeText: 'Welcome!', 
              signInText: 'Sign in to continue',
              ),  
            const Align(
              alignment: Alignment.bottomCenter,
              child: LoginFields(),
            ),
          ],
        ),
      ),
    ],
  );
}
}
