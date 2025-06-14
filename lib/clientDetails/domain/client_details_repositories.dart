import 'package:frontend_flutter/clientDetails/data/models/client.dart';
import 'package:frontend_flutter/clientDetails/data/models/client_delete_response.dart';
import 'package:frontend_flutter/clientDetails/data/models/client_update_request.dart';
import 'package:frontend_flutter/clientDetails/data/models/client_update_response.dart';

abstract class ClientDetailsRepositories {
  Future<Client> getClientById(String id);
  Future<ClientDeleteResponse> deleteClientById(String id);
  Future<ClientUpdateResponse> updateClient(String id, ClientUpdateRequest client);
}