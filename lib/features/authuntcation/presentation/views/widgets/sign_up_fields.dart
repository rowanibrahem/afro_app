import 'package:afro_app/constants.dart';
import 'package:afro_app/core/shared_widget/custom_button.dart';
import 'package:afro_app/core/shared_widget/default_text.dart';
import 'package:afro_app/core/shared_widget/snack_bar.dart';
import 'package:afro_app/core/theme/styles.dart';
import 'package:afro_app/features/authuntcation/presentation/view_model/sign_up/sign_up_cubit.dart';
import 'package:afro_app/features/authuntcation/presentation/view_model/sign_up/sign_up_states.dart';
import 'package:afro_app/features/authuntcation/presentation/views/log_in_view.dart';
import 'package:afro_app/features/authuntcation/presentation/views/widgets/continue_with_google.dart';
import 'package:afro_app/features/authuntcation/presentation/views/widgets/last_part.dart';
import 'package:afro_app/features/authuntcation/presentation/views/widgets/or_widget.dart';
import 'package:afro_app/features/home_screen/presentation/views/widgets/bottom_nav_body,.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    return BlocConsumer<SignUpCubit,SignUpStates>(
      listener: (context, state) async{
       if (state is SignUpSuccessState) {
          // Save tokens to shared preferences
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('token', token!);
          // prefs.setString('accessToken', state.accessToken);
          // prefs.setString('idToken', state.idToken);

          Navigator.pop(context);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => BottomNavBody()),
          );
        } else if (state is SignUpFailedState) {
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
      builder: (context,State) {
        return Form(
        key: formKey,
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
                      validate: (value) {
                            if ((value as String?)?.isEmpty ?? true) {
                              return 'Nmae must not be empty';
                            }
                            return null;
                          },
                    ),
                    const SizedBox(height: 15.0),
                  defaultText(
                    type: TextInputType.emailAddress,
                    controller: emailController,
                    label: 'enter your email',
                    hint: 'your email',
                    prefix: Icons.email,
                    validate: (value) {
                            if ((value as String?)?.isEmpty ?? true) {
                              return 'email must not be empty';
                            }
                            return null;
                          },
                  ),
                  const SizedBox(height: 15.0),
                   defaultText(
                      type: TextInputType.phone,
                      controller: phoneController,
                      label: 'enter your phone',
                      hint: 'your phone',
                      prefix: Icons.phone_android_rounded,
                      validate: (value) {
                            if ((value as String?)?.isEmpty ?? true) {
                              return 'Phone must not be empty';
                            }
                            return null;
                          },
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
                    validate: (value) {
                            if ((value as String?)?.isEmpty ?? true) {
                              return 'Password must not be empty';
                            }
                            return null;
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
                        if (formKey.currentState!.validate()) {
                          try{
                    BlocProvider.of<SignUpCubit>(context).SignUp(
                      name: nameController.text,
                      phoneNum: phoneController.text,
                      email: emailController.text, 
                      password: passwordController.text,
                      );
                            } catch(e) {
                                // Handle authentication error
                                print('Authentication error: $e');
                              }
                        }
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
        ),
      );
      }, 
    );
  }
}