import 'package:afro_app/core/constants/assets_icons.dart';
import 'package:afro_app/core/shared_widget/default_text.dart';
import 'package:afro_app/core/theme/styles.dart';
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

var formKey = GlobalKey <FormState>();
class _LoginBodyState extends State<LoginBody> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
       width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          Stack(
            children: [
              Container(
                child: SvgPicture.asset(
                AssetIcons.loginCurve,
                fit: BoxFit.fill,
                ),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 1.6,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                ),
                
              // Image taking the first part of the screen
         
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                  "Welcome!",
                  style: Styles.textStyle36,
                ),
                Text(
                  "Sign in to continue",
                  style: Styles.textStyle16,
                ),
            ],
          ),  
          ],
          ),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.666,
                padding: const EdgeInsets.only(top: 30, bottom: 20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(70),
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                'Login',
                style: Styles.textStyle24.copyWith(fontWeight: FontWeight.w400),
                ),
                defaultText(
                          type: TextInputType.emailAddress,
                          controller: emailController,
                          label: 'enter your email',
                          hint: 'your email',
                          prefix: Icons.email,
                          // validate: (value){
                          //   if (value!.isEmpty){
                          //     return 'Email must not be empty';
                          //   }
                          //   return null;
                          // },
                          // onChange: (value) {
                          //   print(value);
                          // },
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                   defaultText(
                            type: TextInputType.visiblePassword,
                          // validate: (  value){
                          //   if (value!.isEmpty){
                          //     return 'password is too short';
                          //   }
                          //   return null;
                          // },
                          controller: passwordController,
                          hint: 'Password',
                          label: 'enter your password',
                          prefix: Icons.lock,
                          suffix: isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                            pressed: (){
                              setState(() {
                                isPasswordVisible = !isPasswordVisible;
                              });
                            },
                          onChange: (value) {
                            print(value);
                          },
                          isObscure: !isPasswordVisible,
                        ),
                  ],
                ),
              ),
            ),
        ],
      ),
      
    );
  }
}
