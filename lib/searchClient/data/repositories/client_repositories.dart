import 'package:frontend_flutter/searchClient/data/datasources/client_remote.dart';
import 'package:frontend_flutter/searchClient/data/models/client_model.dart';
import 'package:frontend_flutter/searchClient/domain/client_repositories.dart';

class ClientRepositoryImpl implements ClienteRepository{
  final ClientRemoteDataSource remoteDataSource;

  ClientRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Client>> getClientsById(String id)async{
    final reponse = await remoteDataSource.getClients(id);
    return reponse?.clients ?? [];
  }
}