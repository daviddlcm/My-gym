import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend_flutter/searchClient/data/datasources/client_remote.dart';
import 'package:frontend_flutter/searchClient/data/repositories/client_repositories.dart';
import 'package:frontend_flutter/searchClient/domain/client_use_cases.dart';
import 'package:frontend_flutter/searchClient/presentation/cubit/client_cubit.dart';
import 'login/presentation/login_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Crear instancias de las dependenciasy);
    final clientRemoteDataSource = ClientRemoteDataSource();

    final clientRepository = ClientRepositoryImpl(
      remoteDataSource: clientRemoteDataSource,
    );
    final getClientsById = GetClientsById(clientRepository);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ClientCubit(getClientsById),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
      ),
    );
  }
}
