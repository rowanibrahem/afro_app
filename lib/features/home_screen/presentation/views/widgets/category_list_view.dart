import 'package:afro_app/core/theme/styles.dart';
import 'package:flutter/material.dart';

class CategoryListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SizedBox(
         height: 50,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 3, // Number of items in the ListView
          itemBuilder: (BuildContext context, int index) {
            // List of categories
            final List<String> categories = ["All", "Design", "Programming"];
        
            return Padding(
              padding: const EdgeInsets.only(right: 10), // Add spacing between items
              child: Text(
                categories[index], // Get the category name from the list
                style: Styles.textStyle14,
              ),
            );
          },
        ),
      ),
    );
  }
}
