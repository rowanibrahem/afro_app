import 'package:afro_app/features/authuntcation/presentation/views/widgets/log_in_body.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return  const SafeArea(
      child: Scaffold(
        body: LoginBody(),
      ),
    );
  }
}
