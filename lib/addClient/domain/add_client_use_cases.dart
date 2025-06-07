import 'package:frontend_flutter/addClient/data/models/add_client_request.dart';
import 'package:frontend_flutter/addClient/data/models/add_client_response.dart';
import 'package:frontend_flutter/addClient/domain/add_client_repositories.dart';

class AddClientUseCases {
  final AddClientRepositories repositories;
  AddClientUseCases(this.repositories);

  Future<AddClientResponse?> call (AddClientRequest addClient) async {
    return await repositories.addClientRepositoryImpl(addClient);
  }
}