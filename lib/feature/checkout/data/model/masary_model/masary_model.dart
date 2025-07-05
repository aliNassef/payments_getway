import 'masary_data.dart';

class MasaryModel {
  String? status;
  Data? data;

  MasaryModel({this.status, this.data});

  factory MasaryModel.fromJson(Map<String, dynamic> json) => MasaryModel(
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
