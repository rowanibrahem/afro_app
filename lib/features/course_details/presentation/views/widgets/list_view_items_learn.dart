 import 'package:afro_app/core/constants/assets_icons.dart';
import 'package:afro_app/features/course_details/presentation/views/widgets/list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget buildListViewCourse() {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        buildListItem('Learn HTML and Css', SvgPicture.asset(AssetIcons.checkCard)),
        buildListItem('Java Script', SvgPicture.asset(AssetIcons.checkCard)),
        buildListItem('BoootStrab', SvgPicture.asset(AssetIcons.checkCard)),
      ],
    );
  }

 
