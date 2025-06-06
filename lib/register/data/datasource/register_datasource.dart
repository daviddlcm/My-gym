
import 'package:dio/dio.dart';
import 'package:frontend_flutter/core/network/api_service.dart';
import 'package:frontend_flutter/register/data/models/register_request_model.dart';
import 'package:frontend_flutter/register/data/models/register_response_model.dart';

class RegisterDatasource {
  Future<RegisterResponseModel?> registerDataSource(RegisterRequestModel register) async {
    try{
      final response = await ApiService.post("users/register", data: register.toJson());
      if(response.statusCode == 201){
        return RegisterResponseModel.fromJson(response.data);
      }
      return null;

    }on DioException catch(e){
      print("DioException: ${e.message}");
      return null;
    }catch(error){
      print("Error during registration: $error");
      return null;
    }
  }
}