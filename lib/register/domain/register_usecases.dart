import 'package:frontend_flutter/register/data/models/register_request_model.dart';
import 'package:frontend_flutter/register/data/models/register_response_model.dart';
import 'package:frontend_flutter/register/domain/register_repositories.dart';

class RegisterUsecases {
  final RegisterRepositories repository;
  RegisterUsecases(this.repository);
  Future<RegisterResponseModel?> call(RegisterRequestModel registerRequest) async {
    return await repository.registerRepositoriesImpl(registerRequest);
  }
}