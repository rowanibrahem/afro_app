import 'package:afro_app/features/authuntcation/presentation/views/widgets/back_ground.dart';
import 'package:afro_app/features/authuntcation/presentation/views/widgets/login_fields.dart';
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
  
  return SizedBox(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    child: Stack(
      children: [
        BackgroundContainer(),
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
  );
}
}
