class FawarterkData {
  int? paymentId;
  String? nameEn;
  String? nameAr;
  String? redirect;
  String? logo;

  FawarterkData({
    this.paymentId,
    this.nameEn,
    this.nameAr,
    this.redirect,
    this.logo,
  });

  factory FawarterkData.fromJson(Map<String, dynamic> json) => FawarterkData(
        paymentId: json['paymentId'] as int?,
        nameEn: json['name_en'] as String?,
        nameAr: json['name_ar'] as String?,
        redirect: json['redirect'] as String?,
        logo: json['logo'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'paymentId': paymentId,
        'name_en': nameEn,
        'name_ar': nameAr,
        'redirect': redirect,
        'logo': logo,
      };
}
