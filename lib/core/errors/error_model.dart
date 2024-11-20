class ErrorModel {
  final String errorMessage;
  final bool? isSuccess;
  final int? httpCode;
  final String? name;
  ErrorModel({
    this.isSuccess,
    this.httpCode,
    this.name,
    required this.errorMessage,
  });
  factory ErrorModel.fromJson(Map jsonData) {
    return ErrorModel(
      errorMessage: jsonData["message"],
      name: jsonData["name"],
      httpCode: jsonData["httpCode"],
      isSuccess: jsonData["success"],
    );
  }
}
