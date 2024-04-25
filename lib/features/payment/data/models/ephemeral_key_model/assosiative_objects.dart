class AssociatedObject {

  AssociatedObject({this.id, this.type});

  factory AssociatedObject.fromJson(Map<String, dynamic> json) {
    return AssociatedObject(
      id: json['id'] as String?,
      type: json['type'] as String?,
    );
  }
  String? id;
  String? type;

  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type,
  };
}
