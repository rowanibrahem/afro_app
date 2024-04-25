class AutomaticPaymentMethods {

  AutomaticPaymentMethods({this.enabled});

  factory AutomaticPaymentMethods.fromJson(Map<String, dynamic> json) {
    return AutomaticPaymentMethods(
      enabled: json['enabled'] as bool?,
    );
  }
  bool? enabled;

  Map<String, dynamic> toJson() => {
        'enabled': enabled,
      };
}
