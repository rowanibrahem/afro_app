import 'package:afro_app/core/theme/colors.dart';
import 'package:afro_app/features/profile/presentation/views/widgets/profile_body.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const ColoredBox(
       color: ColorApp.backgroundScaffold,
      child:  SafeArea(
        child: ProfileBody(),
        ),
    );
  }
}
