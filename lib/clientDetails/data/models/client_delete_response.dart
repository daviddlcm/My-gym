class ClientDeleteResponse {
  final String message;
  final bool success;

  ClientDeleteResponse({
    required this.message,
    required this.success,
  });
  factory ClientDeleteResponse.fromJson(Map<String, dynamic> json) {
    return ClientDeleteResponse(
      message: json['message'] as String,
      success: json['success'] as bool,
    );
  }
}