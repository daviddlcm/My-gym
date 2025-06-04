import 'dart:convert';

import 'package:frontend_flutter/searchClient/data/models/client_reponse.dart';
import 'package:http/http.dart' as http;

class ClientRemoteDataSource {
  Future<ClientResponse?> getClients(String id) async {
    final response = await http.get(
      Uri.parse("http://10.0.2.2:3000/api/clients/$id"),
    );
    if (response.statusCode == 200) {
      var decodedJson = jsonDecode(response.body);
      ClientResponse clientResponse = ClientResponse.fromJson(decodedJson);

      return clientResponse;
    } else {
      return null;
    }
  }
}
