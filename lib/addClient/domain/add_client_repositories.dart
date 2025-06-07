import 'package:frontend_flutter/addClient/data/models/add_client_request.dart';
import 'package:frontend_flutter/addClient/data/models/add_client_response.dart';

abstract class AddClientRepositories{
  Future<AddClientResponse> addClientRepositoryImpl(AddClientRequest addClient);
}