import 'package:afro_app/core/theme/colors.dart';
import 'package:afro_app/features/Favourite/presentation/views/widgets/fav_empty_body.dart';
import 'package:flutter/material.dart';

class FavouriteView extends StatelessWidget {
  const FavouriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorApp.backgroundScaffold,
      child: Scaffold(body: FavEmptyBody())
      );
  }
}
