import 'package:frontend_flutter/login/data/models/login_model_response.dart';
import 'package:frontend_flutter/login/data/models/login_model_resquest.dart';

abstract class LoginRepositories{
  Future<LoginResponse> loginSign(LoginRequest loginRequest);
}