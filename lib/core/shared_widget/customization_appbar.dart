import 'package:afro_app/core/functions/service_locator.dart';
import 'package:afro_app/features/Favourite/presentation/view_model/fav_cubit.dart';
import 'package:afro_app/features/Favourite/presentation/view_model/fav_state.dart';
import 'package:afro_app/features/home_screen/data/home_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, this.text ,  this.courseId});
  final String? text;
    final String? courseId;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavCubit(getIt.get<HomeRepoImpl>()),
      child: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
  if (widget.courseId != null)
    BlocBuilder<FavCubit, FavState>(
      builder: (context, state) {
        final isFavourite =
            BlocProvider.of<FavCubit>(context).isCourseFavorite(widget.courseId!);
        return IconButton(
          icon: Icon(
            isFavourite ? Icons.favorite : Icons.favorite_border,
          ),
          onPressed: () {
            BlocProvider.of<FavCubit>(context).toggleFavorite(widget.courseId!);
          },
        );
      },
    ),
],
      ),
    );
  }
}

// import 'package:afro_app/core/functions/service_locator.dart';
// import 'package:afro_app/features/Favourite/presentation/view_model/fav_cubit.dart';
// import 'package:afro_app/features/Favourite/presentation/view_model/fav_state.dart';
// import 'package:afro_app/features/home_screen/data/home_repo_impl.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
//   const CustomAppBar({super.key, this.text, this.courseId});
//   final String? text;
//   final String? courseId;

//   @override
//   State<CustomAppBar> createState() => _CustomAppBarState();

//   @override
//   Size get preferredSize => const Size.fromHeight(kToolbarHeight);
// }

// class _CustomAppBarState extends State<CustomAppBar> {
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       leading: IconButton(
//         icon: const Icon(Icons.arrow_back),
//         onPressed: () {
//           Navigator.pop(context);
//         },
//       ),
//       actions: [
//         IconButton(
//           icon: Icon(Icons.favorite_border_outlined),
//           onPressed: () {},
//         ),
//       ],
//     );
//   }
// }
