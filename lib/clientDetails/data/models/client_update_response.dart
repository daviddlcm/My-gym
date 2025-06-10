import 'package:frontend_flutter/clientDetails/data/models/client.dart';

class ClientUpdateResponse {
  final String message;
  final bool success;

  ClientUpdateResponse({required this.message, required this.success});

  factory ClientUpdateResponse.fromJson(Map<String, dynamic> json) {
  
    return ClientUpdateResponse(
      message: json['message'],
      success: json['success'],
    );
  }
}