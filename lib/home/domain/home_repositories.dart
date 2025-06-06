import 'package:frontend_flutter/home/data/models/client_model.dart';

abstract class HomeRepositories {
  Future<List<Client>> getAllMyClients();
  Future<String?> getCounterMembers();
}