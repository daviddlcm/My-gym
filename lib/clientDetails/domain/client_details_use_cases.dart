import 'package:frontend_flutter/clientDetails/data/models/client.dart';
import 'package:frontend_flutter/clientDetails/domain/client_details_repositories.dart';

class ClientDetailsUseCases {

  final ClientDetailsRepositories repository;
  ClientDetailsUseCases(this.repository);

  Future<Client> getClientById(String id) async {
    return await repository.getClientById(id);
  }

}