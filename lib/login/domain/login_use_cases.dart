import 'package:frontend_flutter/login/data/models/login_model_response.dart';
import 'package:frontend_flutter/login/data/models/login_model_resquest.dart';
import 'package:frontend_flutter/login/domain/login_repositories.dart';

class LoginUseCases {
  final LoginRepositories repository;

  LoginUseCases(this.repository);

  Future<LoginResponse?> call(LoginRequest loginRequest) async {
    return await repository.loginSign(loginRequest);
  }
}