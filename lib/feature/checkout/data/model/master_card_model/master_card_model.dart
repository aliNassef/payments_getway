import 'data.dart';

class MasterCardModel {
  String? status;
  Data? data;

  MasterCardModel({this.status, this.data});

  factory MasterCardModel.fromJson(Map<String, dynamic> json) {
    return MasterCardModel(
      status: json['status'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'data': data?.toJson(),
      };
}
