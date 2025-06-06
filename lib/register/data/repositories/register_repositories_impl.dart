import 'package:frontend_flutter/register/data/datasource/register_datasource.dart';
import 'package:frontend_flutter/register/data/models/register_request_model.dart';
import 'package:frontend_flutter/register/data/models/register_response_model.dart';
import 'package:frontend_flutter/register/domain/register_repositories.dart';

class RegisterRepositoriesImpl implements RegisterRepositories {
  final RegisterDatasource registerDatasource;

  RegisterRepositoriesImpl({required this.registerDatasource});

  @override
  Future<RegisterResponseModel> registerRepositoriesImpl (RegisterRequestModel register) async {
    final response = await registerDatasource.registerDataSource(register);
    if (response == null) {
      throw Exception('Registration failed: response is null');
    }
    return response;
  }
}