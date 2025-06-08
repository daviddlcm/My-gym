import 'package:frontend_flutter/clientDetails/data/datasource/client_details_datasource.dart';
import 'package:frontend_flutter/clientDetails/data/models/client.dart';
import 'package:frontend_flutter/clientDetails/domain/client_details_repositories.dart';

class ClientDetailsRepositoriesImpl implements ClientDetailsRepositories{
  final ClientDetailsDatasource clientDetailsDatasource;

  ClientDetailsRepositoriesImpl({required this.clientDetailsDatasource});
  
  @override
  Future<Client> getClientById(String id) async {
    final response = await clientDetailsDatasource.getClientById(id);
    if(response == null) {
      throw Exception('Client not found');
    }
    return response.client;
  }
}