import 'package:dio/dio.dart';
import 'package:frontend_flutter/clientDetails/data/models/client_delete_response.dart';
import 'package:frontend_flutter/clientDetails/data/models/client_details_reponse.dart';
import 'package:frontend_flutter/core/network/api_service.dart';

class ClientDetailsDatasource {

  Future<ClientDetailsReponse?> getClientById(String id) async {
    try{
      final response = await ApiService.get("clients/client/$id");
      //print("Response from API: ${response.data}");
      return ClientDetailsReponse.fromJson(response.data);
    }on DioException catch(e){
      print("DioException: ${e.message}");
      return null;
    }catch(error){
      print("Error fetching client details: $error");
      return null;
    }
  }
  Future<ClientDeleteResponse?> deleteClienteById(String id) async {
    try{
      final response = await ApiService.delete("clients/$id");
      return ClientDeleteResponse.fromJson(response.data);
    }on DioException catch(e){
      print("DioException: ${e.message}");
      return null;
    } catch(error){
      print("Error deleting client: $error");
      return null;
    }
  }


}