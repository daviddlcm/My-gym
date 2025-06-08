import 'package:frontend_flutter/clientDetails/data/models/client.dart';

class ClientDetailsReponse {
  final String message;
  final Client client;

  ClientDetailsReponse({required this.message, required this.client});

  factory ClientDetailsReponse.fromJson(Map<String, dynamic> json) {
    // var list = json["clients"] as List;
    // List<Client> clientList = list.map((client) => Client.fromJson(client)).toList();

    return ClientDetailsReponse(
      message: json['message'],
      client: Client.fromJson(json['client']),
    );
  }
}