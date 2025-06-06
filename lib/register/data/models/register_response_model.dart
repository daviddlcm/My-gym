class RegisterResponseModel {
  final String? message;
  final bool? success;

  RegisterResponseModel({
    this.message,
    this.success,
  });

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    return RegisterResponseModel(
      message: json['message'] ,
      success: json['success'] ,
    );
  }
}