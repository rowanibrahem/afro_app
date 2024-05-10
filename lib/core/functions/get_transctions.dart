import 'package:afro_app/features/payment/data/models/amount_model/amount_model.dart';
import 'package:afro_app/features/payment/data/models/amount_model/details.dart';
import 'package:afro_app/features/payment/data/models/item_list_model/item.dart';
import 'package:afro_app/features/payment/data/models/item_list_model/item_list_model.dart';

({AmountModel amount, ItemListModel itemList}) getTransctionsData() {
  final amount = AmountModel(
      total: "100",
      currency: 'USD',
      details: Details(shipping: "0", shippingDiscount: 0, subtotal: '100'),
      );

  final List<OrderItemModel> orders = [
    OrderItemModel(
      currency: 'USD',
      name: 'Apple',
      price: "4",
      quantity: 10,
    ),
    OrderItemModel(
      currency: 'USD',
      name: 'Apple',
      price: "5",
      quantity: 12,
    ),
  ];

  final itemList = ItemListModel(orders: orders);

  return (amount: amount, itemList: itemList);
}
