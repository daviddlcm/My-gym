import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:frontend_flutter/core/network/api_service.dart';
import 'package:frontend_flutter/searchClient/data/models/client_reponse.dart';

// class ClientRemoteDataSource {
//   Future<ClientResponse?> getClients(String id) async {
//     final response = await http.get(
//       Uri.parse("http://10.0.2.2:3000/api/clients/$id"),
//     );
//     if (response.statusCode == 200) {
//       var decodedJson = jsonDecode(response.body);
//       ClientResponse clientResponse = ClientResponse.fromJson(decodedJson);

//       return clientResponse;
//     } else {
//       return null;
//     }
//   }
// }

class ClientRemoteDataSource{
  Future<ClientResponse?> getClients(String id) async {
    try{
      final reponse = await ApiService.get("clients//my/clients");
      return ClientResponse.fromJson(reponse.data);
      } on DioException catch (e) {
        print("DioException: ${e.message}");
        return null;
    }catch(error){
      print("Error fetching clients: $error");
      return null;
    }
  }
}
