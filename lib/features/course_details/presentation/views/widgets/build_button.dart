import 'package:afro_app/constants.dart';
import 'package:afro_app/core/shared_widget/custom_button.dart';
import 'package:afro_app/features/course_details/presentation/views/widgets/pop_up.dart';
import 'package:afro_app/features/course_details/presentation/views/widgets/pop_up_log_in.dart';
import 'package:afro_app/features/payment/data/repos/checkout_repo_impl.dart';
import 'package:afro_app/features/payment/presentation/manager/cubit/payment_cubit.dart';
import 'package:afro_app/features/payment/presentation/views/widgets/pay_method_bottomsheet.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget buildButtons(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CustomButton(
          text: 'Add to cart',
          textColor: Colors.white,
          borderRadius: BorderRadius.circular(0),
          func: () {
            showAddToCartPopup(context);
          },
        ),
        const SizedBox(height: 8),
        CustomButton(
          borderRadius: BorderRadius.circular(0),
          backgroundColor: Colors.white,
          text: 'Buy now',
          func: () async {
            print('Button tapped');
            // final loggedIn = await showLoginPopup(context);
            print(token);
            // final User? user = authInstance.currentUser;
            if (token == null) {
              final loggedIn = await showLoginPopup(context);
              if (loggedIn == true) {
                await showLoginPopup(context);
                return;
              } 
                showModalBottomSheet(
                  // ignore: use_build_context_synchronously
                  context: context,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  builder: (context) {
                    print('Building bottom sheet');
                    return BlocProvider(
                      create: (context) => PaymentCubit(CheckoutRepoImpl()),
                      child: const PaymentMethodsBottomSheet(),
                    );
                  },
                );
              
            }
          },
          width: double.infinity,
        ),
      ],
    ),
  );
}


// final authState = context.read<AuthCubit>().state;
//   if (authState is! AuthAuthenticated) {
//     // User is not authenticated, prompt them to log in
//     Navigator.of(context).push(MaterialPageRoute(
//       builder: (context) => LoginScreen(),
//     ));
//     return;
//   }

//   // User is authenticated, proceed with showing the bottom sheet
//   showModalBottomSheet(
//     context: context,
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(16),
//     ),
//     builder: (context) {
//       print('Building bottom sheet');
//       return BlocProvider(
//         create: (context) => PaymentCubit(CheckoutRepoImpl()),
//         child: const PaymentMethodsBottomSheet(),
//       );
//     },
//   );

//another solution : home: isLoggedIn ? DashboardPage() : LoginPage(),