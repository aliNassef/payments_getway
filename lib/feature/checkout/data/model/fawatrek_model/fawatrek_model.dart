import 'datum.dart';

class FawatrekModel {
  String? status;
  List<FawarterkData>? data;

  FawatrekModel({this.status, this.data});

  factory FawatrekModel.fromJson(Map<String, dynamic> json) => FawatrekModel(
        status: json['status'] as String?,
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => FawarterkData.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'data': data?.map((e) => e.toJson()).toList(),
      };
}
