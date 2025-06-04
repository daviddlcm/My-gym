import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend_flutter/addClient/presentation/add_client_page.dart';
import 'package:frontend_flutter/core/colors/app_colors.dart';
import 'package:frontend_flutter/searchClient/presentation/cubit/client_cubit.dart';

class SearchClientPage extends StatefulWidget {
  const SearchClientPage({super.key});

  @override
  State<SearchClientPage> createState() => _SearchClientPageState();
}

class _SearchClientPageState extends State<SearchClientPage> {
  @override
  void initState() {
    super.initState();
    // Cargar los clientes al iniciar la página
    context.read<ClientCubit>().fetchClients("f173260f-3412-4b53-bc84-4c55d6bc4b41");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        centerTitle: true,
        title: const Text(
          "Clientes",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextFormField(
              style: const TextStyle(color: AppColors.texts),
              decoration: const InputDecoration(
                filled: true,
                fillColor: AppColors.backgroundTextFiel,
                labelText: 'Buscar cliente',
                labelStyle: TextStyle(color: AppColors.texts),
                prefixIcon: Icon(Icons.search, color: AppColors.texts),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: BlocBuilder<ClientCubit, ClientState>(
                builder: (context, state) {
                  if (state is ClientLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    );
                  } else if (state is ClientError) {
                    return Center(
                      child: Text(
                        'Error al cargar los clientes: ${state.message}',
                        style: const TextStyle(color: Colors.white),
                      ),
                    );
                  } else if (state is ClientLoaded) {
                    return ListView.builder(
                      itemCount: state.clients.length,
                      itemBuilder: (context, index) {
                        final client = state.clients[index];
                        return ListTile(
                          title: Text(
                            client.name,
                            style: const TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          subtitle: Text(
                            client.email,
                            style: const TextStyle(color: AppColors.texts),
                          ),
                          leading: const Icon(Icons.person, color: Colors.white),
                          onTap: () {
                            // Aquí puedes navegar a los detalles del cliente
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddClientPage(),
            ),
          );
        },
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.add, size: 40, color: Colors.white),
      ),
    );
  }
}
