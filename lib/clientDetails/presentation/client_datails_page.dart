import 'package:flutter/material.dart';
import 'package:frontend_flutter/core/colors/app_colors.dart';

class ClientDetailsPage extends StatefulWidget {
  const ClientDetailsPage({super.key});

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
  String clientId = "12345";
  String membershipStartDate = "2022-01-15";
  String membershipEndDate = "2022-02-15";

  @override
  void initState() {
    super.initState();
    membershipType = "Premium"; // Valor inicial
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          child: Column(
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
                      clientName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Miembro desde 2022",
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "ID: $clientId",
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
                initialValue: clientName,
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
                initialValue: clientEmail,
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
                initialValue: clientPhone,
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
                initialValue: clientAddress,
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
                items: membershipOptions.map((String option) {
                  return DropdownMenuItem<String>(
                    value: option,
                    child: Text(option, style: const TextStyle(color: AppColors.texts)),
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
                initialValue: membershipStartDate,
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
                initialValue: membershipEndDate,
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
                      // Lógica para eliminar cliente
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
          ),
        ),
      ),
    );
  }
}
