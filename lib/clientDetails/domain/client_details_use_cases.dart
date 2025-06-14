import 'package:frontend_flutter/clientDetails/data/models/client.dart';
import 'package:frontend_flutter/clientDetails/data/models/client_delete_response.dart';
import 'package:frontend_flutter/clientDetails/data/models/client_update_request.dart';
import 'package:frontend_flutter/clientDetails/data/models/client_update_response.dart';
import 'package:frontend_flutter/clientDetails/domain/client_details_repositories.dart';

class ClientDetailsUseCases {

  final ClientDetailsRepositories repository;
  ClientDetailsUseCases(this.repository);

  Future<Client> getClientById(String id) async {
    return await repository.getClientById(id);
  }

  Future<ClientDeleteResponse> deleteClientById(String id) async {
    return await repository.deleteClientById(id);
  }
  Future<ClientUpdateResponse> updateClient(String id, ClientUpdateRequest client) async {
    return await repository.updateClient(id, client);
  }

}