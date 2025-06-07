class AddClientResponse {
  final String? message;
  final bool? success;

  AddClientResponse({
    this.message,
    this.success
  });

  factory AddClientResponse.fromJson(Map<String, dynamic> json) {
    return AddClientResponse(
      message: json['message'],
      success: json['success'],
    );
  }
}