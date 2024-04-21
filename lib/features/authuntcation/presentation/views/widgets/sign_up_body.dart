import 'package:afro_app/features/authuntcation/presentation/views/widgets/back_ground.dart';
import 'package:afro_app/features/authuntcation/presentation/views/widgets/logo_top.dart';
import 'package:afro_app/features/authuntcation/presentation/views/widgets/sign_up_fields.dart';
import 'package:afro_app/features/authuntcation/presentation/views/widgets/welcome_text.dart';
import 'package:flutter/material.dart';

class SignupBody extends StatefulWidget {
  const SignupBody({super.key});

  @override
  State<SignupBody> createState() => _SignupBodyState();
}

class _SignupBodyState extends State<SignupBody> {
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
              welcomeText: 'Hi!', 
              signInText: 'Create a new account',
              ),  
            const Align(
              alignment: Alignment.bottomCenter,
              child: SignUpFields(),
            ),
          ],
        ),
      ),
    ],
  );
  }
}
