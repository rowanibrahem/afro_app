import 'package:afro_app/constants.dart';
import 'package:afro_app/core/constants/assets_images.dart';
import 'package:afro_app/core/models/courses.dart';
import 'package:afro_app/features/course_details/presentation/views/course_view.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomCoursesImage extends StatelessWidget {
   CustomCoursesImage({super.key , required this.courseModel});
   final CoursesModel? courseModel;
  //  final String baseUrl = 'https://78c1-156-203-147-75.ngrok-free.app'; 

   List<String> list = [
      
    ];

  @override
  Widget build(BuildContext context) {
    if (courseModel == null || courseModel!.imagePath == null || courseModel!.imagePath!.isEmpty) {
      // Return a default placeholder image
      return _buildPlaceholderImage();
    }
    if (courseModel == null || courseModel!.imagePath == null) {
      return _buildPlaceholderImage();// Placeholder widget for when data is loading or not available
    }

    // Assuming courseModel!.imagePath contains the API-provided image URL
     final imageUrl = baseUrl + courseModel!.imagePath!;

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => CourseView(courseModel: courseModel)),
        );
      },
      child: AspectRatio(
        aspectRatio: 2.2 / 2.5,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            
            // image: DecorationImage(
            //   fit: BoxFit.fill,
            //   // Use NetworkImage for loading images from the network
            //   image: NetworkImage(imageUrl),
            //   // You can provide errorWidget and placeholder if needed
            // ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: InteractiveViewer(
              child: FadeInImage.assetNetwork(
                placeholder: AssetImages.bookDetails,
                width: double.infinity, // Placeholder image
                image: imageUrl, // Original image URL
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
Widget _buildPlaceholderImage() {
    return AspectRatio(
      aspectRatio: 2.2 / 2.5,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: const DecorationImage(
              fit: BoxFit.fill,
              // Use NetworkImage for loading images from the network
              image: AssetImage(AssetImages.bookDetails),
          // Placeholder color
          // You can customize the placeholder appearance as needed
        ),
          
              // You can provide errorWidget and placeholder if needed
            
          ),
        ),
      
    );
  }
