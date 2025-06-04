import 'package:frontend_flutter/searchClient/data/models/client_model.dart';

abstract class ClienteRepository{
  Future<List<Client>> getClientsById(String id);
}