import 'package:afro_app/core/constants/assets_images.dart';
import 'package:afro_app/core/functions/url_launcher.dart';
import 'package:afro_app/core/theme/colors.dart';
import 'package:afro_app/core/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutBody extends StatelessWidget {
  const AboutBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
              AssetImages.logo ,
               width: 150,
               height: 150,),
               ),
            const SizedBox(height: 10,),
            Center(
              child: Text(
                'Afro Asian Board',
                style: Styles.textStyle36.copyWith(fontSize: 30 , color: ColorApp.helpColor),
              ),
            ),
            const SizedBox(
              height: 20,
              ),
            const Text(
              'Who We Are?',
              style: Styles.textStyle18,
            ),
            const SizedBox(
              height: 10,
              ),
             Text(
              'The Afro-Asian Board is a training institution that provides multiple training services.The Afro-Asian Board for Training and Consulting is committed to providing various training services that meet the needs of its clients according to their different sectors, in cooperation with many companies and having accredited certificates, while providing training after the end of each course.',
              style: Styles.textStyle16.copyWith(color: ColorApp.greyCart , fontSize: 14),
              ),
            const Divider(),
            const SizedBox(
              height: 10,
              ),
            const Text(
              'Location',
              style: Styles.textStyle18,
            ),
            const SizedBox(
              height: 10,
              ),
             Text(
              'Abas Elakad',
              style: Styles.textStyle16.copyWith(color: ColorApp.greyCart),
            ),
            const Divider(),
            const SizedBox(
              height: 10,
              ),
            const Text(
              'Hours Of Work',
              style: Styles.textStyle18,
            ),
            const SizedBox(
              height: 10,
              ),
             Text(
              'Mon - Fri | 10 AM - 8 PM \n Sat - Sun | Closed',
              style: Styles.textStyle16.copyWith(color: ColorApp.greyCart),
            ),
            const Divider(),
            const SizedBox(
              height: 10,
              ),
            const Text(
              'Visit Our Website',
              style: Styles.textStyle18,
              ),
              const SizedBox(
              height: 10,
              ),
              GestureDetector(
                onTap: (){
                  launchURL(context ,'https://www.afroasianboard.com');
                },
                child: Text(
                  'afroasianboard.com',
                  style: Styles.textStyle16.copyWith(color: ColorApp.greyCart),
                  ),
              ),
          ],
        ),
      ),
    );
  }
}

