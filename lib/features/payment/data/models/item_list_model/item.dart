class OrderItemModel {

  OrderItemModel({this.name, this.quantity, this.price, this.currency});

  factory OrderItemModel.fromJson(Map<String, dynamic> json) => OrderItemModel(
    name: json['name'] as String?,
    quantity: json['quantity'] as int?,
    price: json['price'] as String?,
    currency: json['currency'] as String?,
  );
  String? name;
  int? quantity;
  String? price;
  String? currency;

  Map<String, dynamic> toJson() => {
    'name': name,
    'quantity': quantity,
    'price': price,
    'currency': currency,
  };
}
