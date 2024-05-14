import 'package:afro_app/core/models/courses.dart';
import 'package:afro_app/core/shared_widget/custom_error.dart';
import 'package:afro_app/core/theme/colors.dart';
import 'package:afro_app/core/theme/styles.dart';
import 'package:afro_app/features/course_details/presentation/view_model/course_cubit.dart';
import 'package:afro_app/features/course_details/presentation/views/widgets/list_view_items_learn.dart';
import 'package:afro_app/features/course_details/presentation/views/widgets/rating.dart';
import 'package:afro_app/features/home_screen/presentation/views/widgets/custom_course_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class BuildCourseImageAndDetails extends StatelessWidget {
  const BuildCourseImageAndDetails({super.key, required this.coursedetails});

  final CoursesModel coursedetails;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoursesDetailsCubit, CoursesDetailsState>(
      builder: (context, state) {
        if (state is CoursesDetailsSuccess) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomCoursesImage(courseModel: coursedetails,),
              // Image.asset(
              //   AssetImages.courseDetails,
              //   width: double.infinity,
              //   fit: BoxFit.cover,
              // ),
              const SizedBox(height: 25),
              Text(
                coursedetails.title.toString(),
                style: Styles.textStyleNoto16.copyWith(fontSize: 20),
              ),
              const SizedBox(height: 25),
              const Rating(),
              const SizedBox(height: 25),
              Text(
                'OverView',
                style: Styles.textStyleNoto16.copyWith(fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                coursedetails.overview.toString(),
                style: Styles.textStyle18.copyWith(color: ColorApp.greyCart),
              ),
              const SizedBox(height: 40),
              Text(
                'What will you learn',
                style: Styles.textStyleNoto16.copyWith(fontSize: 20),
              ),
              const SizedBox(height: 10),
              buildListViewCourse(coursedetails.whatWillYouLearn ?? []),
              const SizedBox(
                height: 30,
              ),
              Text(
                ' EGP ${coursedetails.price} ',
                style: Styles.textStyle16.copyWith(fontSize: 20),
              ),
            ],
          );
        } else if (state is CoursesDetailsFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return _buildShimmerEffect(); // Show shimmer effect while loading
        }
      },
    );
  }

  Widget _buildShimmerEffect() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 200, // Adjust height as per your image size
            color: Colors.white,
          ),
          const SizedBox(height: 25),
          Container(
            width: 150, // Adjust width as per your text size
            height: 20,
            color: Colors.white,
          ),
          const SizedBox(height: 25),
          Container(
            width: 100, // Adjust width as per your rating widget size
            height: 20,
            color: Colors.white,
          ),
          const SizedBox(height: 25),
          Container(
            width: double.infinity, // Adjust width as per your text size
            height: 20,
            color: Colors.white,
          ),
          const SizedBox(height: 10),
          Container(
            width: double.infinity, // Adjust width as per your text size
            height: 20,
            color: Colors.white,
          ),
          const SizedBox(height: 40),
          Container(
            width: double.infinity, // Adjust width as per your text size
            height: 20,
            color: Colors.white,
          ),
          const SizedBox(height: 10),
          Container(
            width: double.infinity, // Adjust width as per your text size
            height: 20,
            color: Colors.white,
          ),
          const SizedBox(height: 30),
          Container(
            width: 100, // Adjust width as per your text size
            height: 20,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
