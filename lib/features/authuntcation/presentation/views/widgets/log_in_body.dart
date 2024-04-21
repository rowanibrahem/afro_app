import 'package:afro_app/core/constants/assets_icons.dart';
import 'package:afro_app/core/shared_widget/custom_button.dart';
import 'package:afro_app/core/shared_widget/default_text.dart';
import 'package:afro_app/core/theme/colors.dart';
import 'package:afro_app/core/theme/styles.dart';
import 'package:afro_app/features/authuntcation/presentation/views/sign_up_view.dart';
import 'package:afro_app/features/home_screen/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class LoginBody extends StatefulWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

bool isPasswordVisible = false;
bool? currentValue;

var formKey = GlobalKey<FormState>();

class _LoginBodyState extends State<LoginBody> {
 @override
Widget build(BuildContext context) {
   double screenWidth = MediaQuery.of(context).size.width;

    double leftPosition = screenWidth >= 600 ? 50 : 20;

    double topPosition = screenWidth >= 600 ? 100 : 80;
  return SizedBox(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    child: Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 1.3,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: SvgPicture.asset(
            AssetIcons.loginCurve,
            fit: BoxFit.fill,
          ),
        ),
          Positioned(
            top: topPosition ,// 20% from the top
            left: leftPosition,
            child:  Column(
              children: [
                const Text(
                    "Welcome!",
                    style: Styles.textStyle36,
                  ),
                  Text(
                    "Sign in to continue",
                    style: Styles.textStyle16.copyWith(color: ColorApp.loginColor),
                  ),
              ],
            ),
          ),  
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
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
                    SizedBox(height: 15,),
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
                      padding: const EdgeInsets.all(10.0),
                      child: CustomButton(
                        text: 'Login',
                        func: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeView(),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const Expanded(
                            child: Divider(
                              thickness: .5,
                              color: Colors.grey,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              'or',
                              style: Styles.textStyle12.copyWith(fontSize: 16),
                            ),
                          ),
                          const Expanded(
                            child: Divider(
                              thickness: .5,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child:  Row(
                            children:  [
                              SvgPicture.asset(AssetIcons.google),
                             const SizedBox(width: 8.0),
                              Text("Continue with Google", style: Styles.textStyle12.copyWith(fontSize: 16 ,
                               color: ColorApp.continueGoogle,),),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account ?",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignupView(),
                              ),
                            );
                          },
                          child: const Text(
                            'Sign Up',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
}
