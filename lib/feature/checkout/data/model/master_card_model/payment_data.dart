class PaymentData {
  String? redirectTo;

  PaymentData({this.redirectTo});

  factory PaymentData.fromJson(Map<String, dynamic> json) => PaymentData(
        redirectTo: json['redirectTo'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'redirectTo': redirectTo,
      };
}
