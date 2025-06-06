import 'package:dio/dio.dart';
import 'package:frontend_flutter/core/network/api_service.dart';
import 'package:frontend_flutter/home/data/models/client_reponse.dart';

class HomeDatasource {
  Future<ClientResponse?> getAllMyClients() async {
    try {
      final response = await ApiService.get("clients/my/clients");
      return ClientResponse.fromJson(response.data);
    }on DioException catch(e){
      print("DioException: ${e.message}");
    }catch(error){
      print("Error fetching clients: $error");
      return null;
    }
  }

  Future<String?> getCounterMembers() async {
    try {
      final response = await ApiService.get("clients/count");
      return response.data['count'].toString();
    }on DioException catch(e){
      print("DioException: ${e.message}");
    }catch(error){
      print("Error fetching clients: $error");
      return null;
    }
  }
}