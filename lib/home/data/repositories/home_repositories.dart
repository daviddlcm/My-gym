import 'package:frontend_flutter/home/data/datasource/home_datasource.dart';
import 'package:frontend_flutter/home/data/models/client_model.dart';
import 'package:frontend_flutter/home/data/models/client_reponse.dart';
import 'package:frontend_flutter/home/domain/home_repositories.dart';

class HomeRepositoriesImpl implements HomeRepositories{
  final HomeDatasource homeDatasource;

  HomeRepositoriesImpl({required this.homeDatasource});

  @override
  Future<List<Client>> getAllMyClients() async{
    final response = await homeDatasource.getAllMyClients();
    return response?.clients ?? [];
  }
  @override
  Future<String?> getCounterMembers() async {
    final response = await homeDatasource.getCounterMembers();
    return response;
  }
}