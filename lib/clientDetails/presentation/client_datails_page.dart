import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend_flutter/clientDetails/presentation/cubit/client_details_cubit.dart';
import 'package:frontend_flutter/clientDetails/presentation/cubit/cliente_delete_cubit.dart';
import 'package:frontend_flutter/core/colors/app_colors.dart';
import 'package:frontend_flutter/home/presentation/home_page.dart';

class ClientDetailsPage extends StatefulWidget {
  final String clientId;
  const ClientDetailsPage({super.key, required this.clientId});

  
  @override
  State<ClientDetailsPage> createState() => _ClientDetailsPageState();
}

class _ClientDetailsPageState extends State<ClientDetailsPage> {
  String? membershipType;
  final List<String> membershipOptions = ["Basica", "Intermedia", "Premium"];

  // Variables para almacenar los datos del cliente
  String clientName = "Ethan Carter";
  String clientEmail = "ethan.carter@email.com";
  String clientPhone = "+1 (555) 123-4567";
  String clientAddress = "123 Main St, Anytown, USA";
  //String clientId = "12345";
  String membershipStartDate = "2022-01-15";
  String membershipEndDate = "2022-02-15";

  @override
  void initState() {
    super.initState();
    //membershipType = "Premium"; // Valor inicial
    context.read<ClientDetailsCubit>().fetchClientById(widget.clientId);
  }

  @override
  Widget build(BuildContext context) {
    //print("este es el id:"+ widget.clientId);

    return MultiBlocListener(listeners: [
      BlocListener<ClienteDeleteCubit,ClienteDeleteState>(
        listener: (context,state){
          if(state is ClienteDeleteLoading){
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Eliminando cliente...")),
            );
          } else if(state is ClienteDeleteSuccess){
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Cliente eliminado con éxito")),
            );
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          } else if(state is ClienteDeleteError){
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Error al eliminar el cliente: ${state.message}")),
            );
          }
        },
      )
    ]
    
      , child: Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        centerTitle: true,
        title: const Text(
          "Detalles del Cliente",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: BlocBuilder<ClientDetailsCubit, ClientDetailsState>(
            builder: (context, state) {
              if (state is ClientDetailsLoading) {
                return const Center(
                  child: CircularProgressIndicator(color: Colors.white),
                );
              } else if (state is ClientDetailsError) {
                return Center(
                  child: Text(
                    "error al cargar el miembro: ${state.message}",
                    style: TextStyle(color: Colors.white),
                  ),
                );
              } else if (state is ClientDetailsLoaded) {
                DateTime startDate = DateTime.parse(state.clientDetails.registrationDate);
                DateTime endDate = DateTime.parse(state.clientDetails.lastVisit);
                String year = startDate.year.toString(); 
                membershipType = state.clientDetails.membership;
                return Column(
                  children: [
                    const SizedBox(height: 20),
                    // Sección de avatar
                    Center(
                      child: Column(
                        children: [
                          const CircleAvatar(
                            radius: 50,
                            backgroundColor: AppColors.backgroundTextFiel,
                            child: Icon(
                              Icons.person,
                              size: 50,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            state.clientDetails.name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Miembro desde año: ${year}",
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "ID: ${state.clientDetails.id}",
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    // Sección de Información Personal
                    const Text(
                      "Información Personal",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      initialValue: state.clientDetails.name,
                      style: const TextStyle(color: AppColors.texts),
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: AppColors.backgroundTextFiel,
                        labelText: 'Nombre',
                        labelStyle: TextStyle(color: AppColors.texts),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      initialValue: state.clientDetails.email,
                      style: const TextStyle(color: AppColors.texts),
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: AppColors.backgroundTextFiel,
                        labelText: 'Correo electrónico',
                        labelStyle: TextStyle(color: AppColors.texts),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      initialValue: state.clientDetails.phone,
                      style: const TextStyle(color: AppColors.texts),
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: AppColors.backgroundTextFiel,
                        labelText: 'Teléfono',
                        labelStyle: TextStyle(color: AppColors.texts),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      initialValue: state.clientDetails.address,
                      style: const TextStyle(color: AppColors.texts),
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: AppColors.backgroundTextFiel,
                        labelText: 'Dirección',
                        labelStyle: TextStyle(color: AppColors.texts),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    // Sección de Detalles de Membresía
                    const Text(
                      "Detalles de la Membresía",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    DropdownButtonFormField<String>(
                      dropdownColor: AppColors.backgroundTextFiel,
                      value: membershipType,
                      style: const TextStyle(color: AppColors.texts),
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: AppColors.backgroundTextFiel,
                        labelText: 'Tipo de Membresía',
                        labelStyle: TextStyle(color: AppColors.texts),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      items:
                          membershipOptions.map((String option) {
                            return DropdownMenuItem<String>(
                              value: option,
                              child: Text(
                                option,
                                style: const TextStyle(color: AppColors.texts),
                              ),
                            );
                          }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          membershipType = newValue;
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      initialValue: startDate.toIso8601String().split("T")[0],
                      style: const TextStyle(color: AppColors.texts),
                      enabled: false,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: AppColors.backgroundTextFiel,
                        labelText: 'Fecha de Inicio',
                        labelStyle: TextStyle(color: AppColors.texts),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      initialValue: endDate.toIso8601String().split("T")[0],
                      style: const TextStyle(color: AppColors.texts),
                      enabled: false,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: AppColors.backgroundTextFiel,
                        labelText: 'Fecha de Finalización',
                        labelStyle: TextStyle(color: AppColors.texts),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    // Botones de acción
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Lógica para actualizar cliente
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.buttonBackground,
                            padding: const EdgeInsets.symmetric(vertical: 15),
                          ),
                          child: const Text(
                            'Actualizar Cliente',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            context.read<ClienteDeleteCubit>().deleteClientById(widget.clientId);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            padding: const EdgeInsets.symmetric(vertical: 15),
                          ),
                          child: const Text(
                            'Eliminar Cliente',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              }
              return const Center(
                child: Text(
                  'No se encontraron detalles del cliente',
                  style: TextStyle(color: Colors.white),
                ),
              );
            },
          ),
        ),
      ),
    )
    
    );
  }
}
