import 'package:frontend_flutter/home/data/models/client_model.dart';
import 'package:frontend_flutter/home/domain/home_repositories.dart';

class HomeUseCase {
  final HomeRepositories repository;
  HomeUseCase(this.repository);
  Future<List<Client>> call() async{
    return await repository.getAllMyClients();
  }
  Future<String?> getCounterMembers() async {
    return await repository.getCounterMembers();
  }
}