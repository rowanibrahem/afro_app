import 'package:afro_app/core/shared_widget/custom_button.dart';
import 'package:afro_app/core/shared_widget/default_text.dart';
import 'package:afro_app/core/theme/styles.dart';
import 'package:afro_app/features/authuntcation/presentation/views/sign_up_view.dart';
import 'package:afro_app/features/authuntcation/presentation/views/widgets/continue_with_google.dart';
import 'package:afro_app/features/authuntcation/presentation/views/widgets/last_part.dart';
import 'package:afro_app/features/authuntcation/presentation/views/widgets/or_widget.dart';
import 'package:afro_app/features/home_screen/presentation/views/widgets/bottom_nav_body,.dart';
import 'package:flutter/material.dart';

class LoginFields extends StatefulWidget {
  const LoginFields({super.key});

  @override
  State<LoginFields> createState() => _LoginFieldsState();
}
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

bool isPasswordVisible = false;
bool? currentValue;

GlobalKey<FormState> formKey = GlobalKey<FormState>();

class _LoginFieldsState extends State<LoginFields> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 1.5,
      padding: const EdgeInsets.only(top: 30, bottom: 20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(70),
        ),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Login',
                style: Styles.textStyle24.copyWith(fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 20,),
              defaultText(
                type: TextInputType.emailAddress,
                controller: emailController,
                label: 'enter your email',
                hint: 'your email',
                prefix: Icons.email,
              ),
              const SizedBox(height: 15.0),
              defaultText(
                type: TextInputType.visiblePassword,
                controller: passwordController,
                hint: 'Password',
                label: 'enter your password',
                prefix: Icons.lock,
                suffix: isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                pressed: () {
                  setState(() {
                    isPasswordVisible = !isPasswordVisible;
                  });
                },
                onChange: (value) {
                  print(value);
                },
                isObscure: !isPasswordVisible,
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: CustomButton(
                  text: 'Login',
                  func: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BottomNavBody(),
                      ),
                    );
                  },
                ),
              ),
              const ORWidget(),
              const SizedBox(height: 15,),
              const ContinueWithGoogle(),
              const SizedBox(height: 20,),
               LastPart(
                buttonText: 'Sign Up',
                text1: "Don't have an account ?",
                onPressed: (){
                      Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignupView(),
                              ),
                            );
                },
            ),
            ],
          ),
        ),
      ),
    );
  }
}
