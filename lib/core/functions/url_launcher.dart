
import 'package:afro_app/core/functions/customSnackBar.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchURL(BuildContext context,String url) async {
  final Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    showSnackBar(context, "Cann 't Launch $url");
  }
}
