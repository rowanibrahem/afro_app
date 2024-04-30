import 'package:afro_app/features/Favourite/presentation/views/widgets/fav_body.dart';
import 'package:flutter/material.dart';

class FavView extends StatelessWidget {
  const FavView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FavBody(),
    );
  }
}