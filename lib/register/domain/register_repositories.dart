import 'package:frontend_flutter/register/data/models/register_request_model.dart';
import 'package:frontend_flutter/register/data/models/register_response_model.dart';

abstract class RegisterRepositories {
  Future<RegisterResponseModel> registerRepositoriesImpl(RegisterRequestModel register);
}