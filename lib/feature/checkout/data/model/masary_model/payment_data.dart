class PaymentData {
  int? masaryCode;

  PaymentData({this.masaryCode});

  factory PaymentData.fromJson(Map<String, dynamic> json) =>
      PaymentData(masaryCode: json['masaryCode']);

  Map<String, dynamic> toJson() => {
        'masaryCode': masaryCode,
      };
}
