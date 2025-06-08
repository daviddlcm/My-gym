import 'package:frontend_flutter/clientDetails/data/models/client.dart';

abstract class ClientDetailsRepositories {
  Future<Client> getClientById(String id);
}