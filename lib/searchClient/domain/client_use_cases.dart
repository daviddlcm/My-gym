import 'package:frontend_flutter/searchClient/data/models/client_model.dart';
import 'package:frontend_flutter/searchClient/domain/client_repositories.dart';

class GetClientsById{
  final ClienteRepository repository;

  GetClientsById(this.repository);

  Future<List<Client>> call(String id) async {
    return await repository.getClientsById(id);
  }
}