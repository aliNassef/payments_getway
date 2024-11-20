class PaymentData {
  String? fawryCode;
  String? expireDate;

  PaymentData({this.fawryCode, this.expireDate});

  factory PaymentData.fromJson(Map<String, dynamic> json) => PaymentData(
        fawryCode: json['fawryCode'] as String?,
        expireDate: json['expireDate'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'fawryCode': fawryCode,
        'expireDate': expireDate,
      };
}
