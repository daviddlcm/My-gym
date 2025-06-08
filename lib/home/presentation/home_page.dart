import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend_flutter/clientDetails/presentation/client_datails_page.dart';
import 'package:frontend_flutter/core/colors/app_colors.dart';
import 'package:frontend_flutter/core/navigation/app_navigation_bar.dart';
import 'package:frontend_flutter/home/presentation/cubit/counter_members_cubit.dart';
import 'package:frontend_flutter/home/presentation/cubit/search_client_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<SearchClientCubit>().fetchClients();
    context.read<CounterMembersCubit>().fetchCounterMembers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,

      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.primary,
        centerTitle: true,
        title: Text(
          "Panel",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.white),
            onPressed: () {
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: 8),
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(
                        color: AppColors.backgroundTextFiel,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(25),
                        child: BlocBuilder<
                          CounterMembersCubit,
                          CounterMembersState
                        >(
                          builder: (context, state) {
                            if (state is CounterMembersLoading) {
                              return const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              );
                            } else if (state is CounterMembersError) {
                              return Center(
                                child: Text(
                                  'Error al cargar los miembros: ${state.message}',
                                  style: const TextStyle(color: Colors.white),
                                ),
                              );
                            } else if (state is CounterMembersLoaded) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Clientes registrados",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    state.num,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              );
                            }
                            return const Center(
                              child: Text(
                                'No hay miembros disponibles',
                                style: TextStyle(color: Colors.white),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(
                        color: AppColors.backgroundTextFiel,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(25),
                        child: Column(
                          children: [
                            Text(
                              "Usuarios activos",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "85",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              "Actividad Reciente",
              style: TextStyle(
                color: Colors.white,
                fontSize: 27,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 10),
            Expanded(
              child: BlocBuilder<SearchClientCubit, SearchClientState>(
                builder: (context, state) {
                  if (state is SearchClientLoading) {
                    return const Center(
                      child: CircularProgressIndicator(color: Colors.white),
                    );
                  } else if (state is SearchClientError) {
                    return Center(
                      child: Text(
                        'Error al cargar los clientes: ${state.message}',
                        style: const TextStyle(color: Colors.white),
                      ),
                    );
                  } else if (state is SearchClientLoaded) {
                    return ListView.builder(
                      itemCount: state.clients.length,
                      itemBuilder: (context, index) {
                        final client = state.clients[index];
                        return ListTile(
                          title: Text(
                            client.name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          subtitle: Text(
                            client.email,
                            style: const TextStyle(color: AppColors.texts),
                          ),
                          leading: const Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ClientDetailsPage(clientId: client.id),
                            )
                            );
                          },
                        );
                      },
                    );
                  }
                  return const Center(
                    child: Text(
                      'No hay clientes disponibles',
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: AppNavigationBar(),
    );
  }
}
