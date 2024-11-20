import 'data.dart';

class FawryModel {
  String? status;
  Data? data;

  FawryModel({this.status, this.data});

  factory FawryModel.fromJson(Map<String, dynamic> json) => FawryModel(
        status: json['status'] as String?,
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'data': data?.toJson(),
      };
}
