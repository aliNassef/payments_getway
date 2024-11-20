class FawaterkInputModel {
  final int paymentMethodId;
  final String cartTotal;
  final String currency;

  FawaterkInputModel({
    required this.paymentMethodId,
    required this.cartTotal,
    required this.currency,
  });
  toJson() => {
        'payment_method_id': paymentMethodId,
        'cartTotal': cartTotal,
        'currency': currency,
      };

  factory FawaterkInputModel.fromJson(Map<String, dynamic> json) =>
      FawaterkInputModel(
        paymentMethodId: json['payment_method_id'],
        cartTotal: json['cartTotal'],
        currency: json['currency'],
      );
}
