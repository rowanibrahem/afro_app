import 'package:afro_app/features/payment/data/models/item_list_model/item.dart';

class ItemListModel {

  ItemListModel({this.orders});

  factory ItemListModel.fromJson(Map<String, dynamic> json) => ItemListModel(
    orders: (json['items'] as List<dynamic>?)
        ?.map((e) => OrderItemModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
  List<OrderItemModel>? orders;

  Map<String, dynamic> toJson() => {
    'items': orders?.map((e) => e.toJson()).toList(),
  };
}
