import 'package:afro_app/core/theme/styles.dart';
import 'package:afro_app/features/authuntcation/presentation/views/log_in_view.dart';
import 'package:flutter/material.dart';

Future<bool?> showLoginPopup(BuildContext context) async {
  bool? loggedIn = false; // Initialize the login status

  await showDialog<bool>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        elevation: 20, 
        content: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('You must log in'),
              const SizedBox(height: 20),
              Text(
      
                'Already have an account?',
                style: Styles.textStyle24.copyWith(fontSize: 15),
              ),
              GestureDetector(
                onTap: () async {
                  // Navigate to login view and wait for result
                  final result = await Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginView(),
                    ),
                  );
                  loggedIn = result as bool? ?? false;
                  Navigator.pop(context, loggedIn); // Close dialog and return result
                },
                child: Text(
                  'Log in',
                  style: Styles.textStyle24.copyWith(fontSize: 15),
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(loggedIn); // Close dialog and return login status
            },
            child: const Text('Close'),
          ),
        ],
      );
    },
  );

  return loggedIn; // Return the login status
}

