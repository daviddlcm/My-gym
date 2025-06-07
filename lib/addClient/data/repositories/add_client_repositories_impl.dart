import 'package:frontend_flutter/addClient/data/datasource/add_client_datasource.dart';
import 'package:frontend_flutter/addClient/data/models/add_client_request.dart';
import 'package:frontend_flutter/addClient/data/models/add_client_response.dart';
import 'package:frontend_flutter/addClient/domain/add_client_repositories.dart';

class AddClientRepositoriesImpl implements AddClientRepositories {
  final AddClientDatasource addClientDatasource;
  
  AddClientRepositoriesImpl({required this.addClientDatasource});

  @override
  Future<AddClientResponse> addClientRepositoryImpl(AddClientRequest addClient) async {
    final response = await addClientDatasource.addClientDataSource(addClient);
    if (response == null) {
      throw Exception('Adding client failed: response is null');
    }
    return response;
  }
}