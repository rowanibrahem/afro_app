 import 'package:afro_app/core/constants/assets_icons.dart';
import 'package:afro_app/features/course_details/presentation/views/widgets/list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget buildListViewCourse(List<String> learnItems) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
     itemCount: learnItems.length,
    itemBuilder: (context, index) {
      return buildListItem(
        learnItems[index], // Pass each learning item
        SvgPicture.asset(AssetIcons.checkCard),
      );
    },

    );
  }

 
