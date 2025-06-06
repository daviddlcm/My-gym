import 'package:dio/dio.dart';
import 'package:frontend_flutter/core/network/api_service.dart';
import 'package:frontend_flutter/login/data/models/login_model_response.dart';
import 'package:frontend_flutter/login/data/models/login_model_resquest.dart';

class LoginRemote {
  Future<LoginResponse?> loginRemote(LoginRequest login) async {
    try {
      final response = await ApiService.post("users/login", data: login.toJson());
      if(response.statusCode == 200){
        return LoginResponse.fromJson(response.data);
      }
      return null;
    } on DioException catch (e) {
      print("DioException: ${e.message}");
      return null;
    } catch (error) {
      print("Error during login: $error");
      return null;
    }
  }
}
