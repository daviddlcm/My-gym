import 'package:frontend_flutter/searchClient/data/models/client_model.dart';

class ClientResponse{
  final String message;
  final List<Client> clients;
  
  ClientResponse({required this.message, required this.clients});

  factory ClientResponse.fromJson(Map<String, dynamic> json){
    var list = json["clients"] as List;
    List<Client> clientList = list.map((client) => Client.fromJson(client)).toList();

    return ClientResponse(
      message: json['message'],
      clients: clientList
    );
  }
}