import 'package:afro_app/core/shared_widget/custom_button_mine.dart';
import 'package:afro_app/core/shared_widget/default_text.dart';
import 'package:afro_app/core/theme/styles.dart';
import 'package:afro_app/features/authuntcation/presentation/views/log_in_view.dart';
import 'package:afro_app/features/authuntcation/presentation/views/widgets/continue_with_google.dart';
import 'package:afro_app/features/authuntcation/presentation/views/widgets/last_part.dart';
import 'package:afro_app/features/authuntcation/presentation/views/widgets/or_widget.dart';
import 'package:afro_app/features/home_screen/presentation/views/home_view.dart';
import 'package:flutter/material.dart';

class SignUpFields extends StatefulWidget {
  const SignUpFields({super.key});

  @override
  State<SignUpFields> createState() => _SignUpFields();
}
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController nameController = TextEditingController();
TextEditingController phoneController = TextEditingController();
TextEditingController confirmController = TextEditingController();

bool isPasswordVisible = false;
bool? currentValue;

GlobalKey<FormState> formKey = GlobalKey<FormState>();

class _SignUpFields extends State<SignUpFields> {
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
                'Sign up',
                style: Styles.textStyle24.copyWith(fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 20,),
               defaultText(
                  type: TextInputType.text,
                  controller: nameController,
                  label: 'enter your name',
                  hint: 'your name',
                  prefix: Icons.person,
                  // validate: ( value){
                  //   // ignore: avoid_dynamic_calls
                  //   if (value!.isEmpty){
                  //     return 'name must not be empty';
                  //   }
                  //   return null;
                  // },
                ),
                const SizedBox(height: 15.0),
              defaultText(
                type: TextInputType.emailAddress,
                controller: emailController,
                label: 'enter your email',
                hint: 'your email',
                prefix: Icons.email,
              ),
              const SizedBox(height: 15.0),
               defaultText(
                  type: TextInputType.phone,
                  controller: phoneController,
                  label: 'enter your phone',
                  hint: 'your phone',
                  prefix: Icons.phone_android_rounded,
                  // validate: ( value){
                  //   if (value!.isEmpty){
                  //     return 'phone must not be empty';
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
                isObscure: !isPasswordVisible,
              ),
              const SizedBox(
                  height: 15.0,
                ),
               defaultText(
                type: TextInputType.visiblePassword,
                controller: confirmController,
                hint: 'Confirm Password',
                label: 'confirm password',
                prefix: Icons.lock,
                suffix: isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                pressed: () {
                  setState(() {
                    isPasswordVisible = !isPasswordVisible;
                  });
                },
                isObscure: !isPasswordVisible,
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: CustomButton(
                  text: 'SignUp',
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
              const ORWidget(),
              const SizedBox(height: 15,),
              const ContinueWithGoogle(),
              const SizedBox(height: 20,),
               LastPart(
                buttonText: 'Login',
                text1: "Already have an account?",
                onPressed: (){
                      Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginView(),
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