import 'package:afro_app/core/shared_widget/custom_appbar.dart';
import 'package:afro_app/features/profile/presentation/views/widgets/help_body.dart';
import 'package:flutter/material.dart';

class HelpView extends StatelessWidget {
  const HelpView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child:  Scaffold(
         appBar: CustomAppBarTitle(
          text: 'Help',
         ),
        body:  HelpBody(),
      ),
    );
  }
}