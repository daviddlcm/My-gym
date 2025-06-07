import 'package:dio/dio.dart';
import 'package:frontend_flutter/addClient/data/models/add_client_request.dart';
import 'package:frontend_flutter/addClient/data/models/add_client_response.dart';
import 'package:frontend_flutter/core/network/api_service.dart';

class AddClientDatasource {
  Future<AddClientResponse?> addClientDataSource(AddClientRequest addClient) async {
    try{
      final response = await ApiService.post("/clients",data :addClient.toJson());
      if(response.statusCode == 201){
        return AddClientResponse.fromJson(response.data);
      }
      return null;
    }on DioException catch(e){
      print("DioException: ${e.message}");
      return null;
    }catch(error){
      print("Error during adding client: $error");
      return null;
    }
  }
}