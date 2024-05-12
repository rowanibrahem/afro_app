import 'package:flutter/material.dart';

class AboutBody extends StatelessWidget {
  const AboutBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Center(
            child: Text(
              'Afro Asian Board',
              
            ),
          ),
          Text(
            'Wo We Are?',
          ),
          Text(
            'data',
            ),
          Divider(),
          Text(
            'Location',
          ),
          Text(
            'Abas Elakad',
          ),
          Divider(),
          Text(
            'Hours Of Work',
          ),
          Text(
            'Mon - Fri | 10 AM - 8 PM "\n" Sat - Sun | Closed',
          ),
          Divider(),
          Text(
            'Visit Our Website',
            ),
        ],
      ),
    );
  }
}
