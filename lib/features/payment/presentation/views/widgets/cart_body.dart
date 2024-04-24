import 'package:afro_app/core/shared_widget/custom_button.dart';
import 'package:afro_app/features/payment/data/repos/checkout_repo_impl.dart';
import 'package:afro_app/features/payment/presentation/manager/cubit/payment_cubit.dart';
import 'package:afro_app/features/payment/presentation/views/widgets/order_info_item.dart';
import 'package:afro_app/features/payment/presentation/views/widgets/pay_method_bottomsheet.dart';
import 'package:afro_app/features/payment/presentation/views/widgets/total_price_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CartBody extends StatelessWidget {
  const CartBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const Expanded(
              child: Image(
                  image: AssetImage('assets/images/test.png'),
              ),
          ),
          const SizedBox(
            height: 25,
          ),
          const OrderInfoItem(
              title: 'Order Subtotal',
              value: '40.9'
          ),
          const SizedBox(
            height: 3,
          ),
          const OrderInfoItem(
              title: 'Order Subtotal',
              value: '40.9'
          ),
          const SizedBox(
            height: 3,
          ),
          const OrderInfoItem(
              title: 'Order Subtotal',
              value: '40.9'
          ),
          const Divider(
            thickness: 2,
            height: 34,
            color: Color(0xffC7C7C7),
          ),
          const TotalPrice(
              title: 'Total',
              value: '50.7',
          ),
          const SizedBox(
            height: 17,
          ),
          CustomButton(
            text: 'Complete Payment',
            // onTap: (){
            //   Navigator.of(context).push(MaterialPageRoute(builder: (context){
            //     return PayDetails();
            //   }));
          onTap: (){
            print('Button tapped');
            showModalBottomSheet(
                    context: context,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    builder: (context) {
                      print('Building bottom sheet');
                      return BlocProvider(
                        create: (context) => PaymentCubit(CheckoutRepoImpl()),
                        child: const PaymentMethodsBottomSheet(),
                      );
                    });
              }),
          const SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}
