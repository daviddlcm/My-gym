import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend_flutter/home/data/datasource/home_datasource.dart';
import 'package:frontend_flutter/home/data/repositories/home_repositories.dart';
import 'package:frontend_flutter/home/domain/home_use_case.dart';
import 'package:frontend_flutter/home/presentation/cubit/counter_members_cubit.dart';
import 'package:frontend_flutter/home/presentation/cubit/search_client_cubit.dart';
import 'package:frontend_flutter/login/data/datasource/login_remote.dart';
import 'package:frontend_flutter/login/data/repositories/login_repositories_impl.dart';
import 'package:frontend_flutter/login/domain/login_use_cases.dart';
import 'package:frontend_flutter/login/presentation/cubit/login_cubit.dart';
import 'package:frontend_flutter/register/data/datasource/register_datasource.dart';
import 'package:frontend_flutter/register/data/repositories/register_repositories_impl.dart';
import 'package:frontend_flutter/register/domain/register_usecases.dart';
import 'package:frontend_flutter/register/presentation/cubit/register_cubit.dart';
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
    //searchCLient
    final clientRemoteDataSource = ClientRemoteDataSource();

    final clientRepository = ClientRepositoryImpl(
      remoteDataSource: clientRemoteDataSource,
    );
    final getClientsById = GetClientsById(clientRepository);
    //login
    final loginRemote = LoginRemote();

    final loginRepository = LoginRepositoriesImpl(loginRemote: loginRemote);
    final loginUseCase = LoginUseCases(loginRepository);
    //home
    final homeRemote = HomeDatasource();
    final homeRepositoryu = HomeRepositoriesImpl(homeDatasource: homeRemote);
    final homeUseCases = HomeUseCase(homeRepositoryu);
    //register
    final registerRemote = RegisterDatasource();
    final registerRepository = RegisterRepositoriesImpl(
      registerDatasource: registerRemote,
    );
    final registerUseCases = RegisterUsecases(registerRepository);

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ClientCubit(getClientsById)),
        BlocProvider(create: (_) => LoginCubit(loginUseCase)),
        BlocProvider(create: (_) => SearchClientCubit(homeUseCases)),
        BlocProvider(create: (_) => CounterMembersCubit(homeUseCases)),
        BlocProvider(create: (_) => RegisterCubit(registerUseCases)),
      ],
      child: MaterialApp(debugShowCheckedModeBanner: false, home: LoginPage()),
    );
  }
}
