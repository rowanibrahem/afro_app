import 'package:afro_app/features/Favourite/presentation/view_model/fav_cubit.dart';
import 'package:afro_app/features/Favourite/presentation/views/widgets/fav_body.dart';
import 'package:afro_app/features/course_details/presentation/view_model/course_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavView extends StatefulWidget {
  const FavView({super.key});

  @override
  State<FavView> createState() => _FavViewState();
}

class _FavViewState extends State<FavView> {


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // appBar: AppBar(
      //   title: const Icon(Icons.backpack_outlined),
      // ),
      body: FavBody(),
    );
  }
}