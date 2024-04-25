import 'package:afro_app/features/payment/presentation/views/widgets/pay_method_item.dart';
import 'package:flutter/material.dart';
class PayMethodListView extends StatefulWidget {
   const PayMethodListView({super.key, required this.updatePaymentMethod});
   final Function({required int index}) updatePaymentMethod;
  @override
  State<PayMethodListView> createState() => _PayMethodListViewState();
}

class _PayMethodListViewState extends State<PayMethodListView> {
  final List<String> paymentMethodsItems = const [
    'assets/icons/card.svg',
    'assets/icons/paypal.svg',
  ];

  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      child: ListView.builder(
         itemCount:  paymentMethodsItems .length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context , index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: GestureDetector(
                onTap: (){
                  activeIndex = index;
                  setState(() {
                 widget.updatePaymentMethod(index: activeIndex);
                  });
                },
                child: PayListItem(
                    isActive: activeIndex == index,
                    image: paymentMethodsItems[index],
                ),
              ),
            );
          },
      ),
    );
  }
}
