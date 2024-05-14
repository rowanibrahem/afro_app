// ignore_for_file: avoid_dynamic_calls

import 'package:afro_app/constants.dart';
import 'package:afro_app/core/services/auth_services.dart';
import 'package:afro_app/core/shared_widget/custom_button.dart';
import 'package:afro_app/core/shared_widget/default_text.dart';
import 'package:afro_app/core/shared_widget/snack_bar.dart';
import 'package:afro_app/core/theme/styles.dart';
import 'package:afro_app/features/authuntcation/presentation/view_model/log_in_cubit.dart';
import 'package:afro_app/features/authuntcation/presentation/view_model/log_in_state.dart';
import 'package:afro_app/features/authuntcation/presentation/views/sign_up_view.dart';
import 'package:afro_app/features/authuntcation/presentation/views/widgets/continue_with_google.dart';
import 'package:afro_app/features/authuntcation/presentation/views/widgets/last_part.dart';
import 'package:afro_app/features/authuntcation/presentation/views/widgets/or_widget.dart';
import 'package:afro_app/features/home_screen/presentation/views/widgets/bottom_nav_body,.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    return BlocConsumer<LoginCubit, AuthStates>(
      listener: (context, state) async {
        if (state is LogInSuccessState) {
          // Save tokens to shared preferences
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('token', token!);
          // prefs.setString('accessToken', state.accessToken);
          // prefs.setString('idToken', state.idToken);

          Navigator.pop(context);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const BottomNavBody()),
          );
        } else if (state is LogInFailedState) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            customSnackBar(message: state.message!),
          );
        } else {
          showDialog(
            context: context,
            builder: (_) => const AlertDialog(
              content: Row(
                children: [
                  CircularProgressIndicator(
                    color: Colors.green,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Loading.."),
                ],
              ),
            ),
          );
        }
      },
      builder: (context, state) => Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 1.5,
        padding: const EdgeInsets.only(top: 30, bottom: 20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(70),
          ),
        ),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Login',
                    style: Styles.textStyle24
                        .copyWith(fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  defaultText(
                    type: TextInputType.emailAddress,
                    controller: emailController,
                    label: 'enter your email',
                    hint: 'your email',
                    prefix: Icons.email,
                    validate: (dynamic value) {
                      if ((value as String?)?.isEmpty ?? true) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15.0),
                  defaultText(
                    type: TextInputType.visiblePassword,
                    controller: passwordController,
                    hint: 'Password',
                    label: 'enter your password',
                    prefix: Icons.lock,
                    suffix: isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    pressed: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                    onChange: (value) {
                      print(value);
                    },
                    isObscure: !isPasswordVisible,
                    validate: (value) {
                      if ((value as String?)?.isEmpty ?? true) {
                        return 'Password must not be empty';
                      }
                      return null;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: CustomButton(
                      text: 'Login',
                      func: () {
                        if (formKey.currentState!.validate()) {
                          try {
                            //  final String email = emailController.text;
                            //  final String password = passwordController.text;

                            // Call the logIn method from LoginCubit
                            BlocProvider.of<LoginCubit>(context).LogIn(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                          } catch (e) {
                            // Handle authentication error
                            print('Authentication error: $e');
                          }
                        }
                        // Navigator.pushReplacement(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => const BottomNavBody(),
                        //   ),
                        // );
                      },
                    ),
                  ),
                  const ORWidget(),
                  const SizedBox(
                    height: 15,
                  ),
                  ContinueWithGoogle(
                 onTap: () async {
                  try {
                 await AuthService.signInWithGoogle();
               Navigator.push(
                 context,
                 MaterialPageRoute(
          builder: (context) => const BottomNavBody(),
        ),
      );
    } catch (e) {
      // Handle sign-in errors
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Sign-In Error'),
            content: const Text('Failed to sign in with Google. Please try again later.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
      print('Sign-in error: $e');
    }
  },
),
                  const SizedBox(
                    height: 20,
                  ),
                  LastPart(
                    buttonText: 'Sign Up',
                    text1: "Don't have an account ?",
                    onPressed: () {
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
        ),
      ),
    );
  }
}
