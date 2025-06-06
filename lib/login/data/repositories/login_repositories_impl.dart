import 'package:frontend_flutter/login/data/datasource/login_remote.dart';
import 'package:frontend_flutter/login/data/models/login_model_response.dart';
import 'package:frontend_flutter/login/data/models/login_model_resquest.dart';
import 'package:frontend_flutter/login/domain/login_repositories.dart';

class LoginRepositoriesImpl implements LoginRepositories{
  final LoginRemote loginRemote;

  LoginRepositoriesImpl({required this.loginRemote});

  @override
  Future<LoginResponse> loginSign (LoginRequest loginRequest) async {
    final response = await loginRemote.loginRemote(loginRequest);
    if (response == null) {
      throw Exception('Login failed: response is null');
    }
    return response;
  }
  
  
}