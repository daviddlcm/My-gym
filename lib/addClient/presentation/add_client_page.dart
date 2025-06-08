import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend_flutter/addClient/presentation/cubit/add_client_cubit.dart';
import 'package:frontend_flutter/core/colors/app_colors.dart';

class AddClientPage extends StatefulWidget {
  const AddClientPage({super.key});

  @override
  State<AddClientPage> createState() => _AddClientPageState();
}

class _AddClientPageState extends State<AddClientPage> {
  String? optionSelected;
  String? optionSelectedMonths;

  final List<String> options = [
    "Basica",
    "Intermedia",
    "Premium"
  ];

  final List<String> optionsMonths = [
    "1 mes",
    "3 meses",
    "6 meses",
    "12 meses"
  ];

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        centerTitle: true,
        title: Text(
          "Añadir nuevo cliente",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextFormField(
              controller: _nameController,
                style: TextStyle(
                  color: AppColors.texts
                ),
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: AppColors.backgroundTextFiel,
                  labelText: 'Nombre',
                  labelStyle: TextStyle(color: AppColors.texts),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    borderSide: BorderSide.none,
                  )
                  
                )
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _emailController,
                style: TextStyle(
                  color: AppColors.texts
                ),
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: AppColors.backgroundTextFiel,
                  labelText: 'Correo electrónico',
                  labelStyle: TextStyle(color: AppColors.texts),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    borderSide: BorderSide.none,
                  )
                  
                )
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _phoneController,
                style: TextStyle(
                  color: AppColors.texts
                ),
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: AppColors.backgroundTextFiel,
                  labelText: 'Teléfono',
                  labelStyle: TextStyle(color: AppColors.texts),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    borderSide: BorderSide.none,
                  )
                  
                )
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _addressController,
                style: TextStyle(
                  color: AppColors.texts
                ),
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: AppColors.backgroundTextFiel,
                  labelText: 'Dirección',
                  labelStyle: TextStyle(color: AppColors.texts),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    borderSide: BorderSide.none,
                  )
                  
                )
              ),
              
              SizedBox(height: 20),
              DropdownButtonFormField<String>(
                dropdownColor: AppColors.backgroundTextFiel,
                
                hint: Text("Seleccione el tipo de membresía", style: TextStyle(color: AppColors.texts)),
                value: optionSelected,
                onChanged: (String? newOption){
                  setState(() {
                    optionSelected = newOption;
                  });
                },
                items: options.map((String option) {
                  return DropdownMenuItem<String>(
                    value: option,
                    child: Text(option, style: TextStyle(color: AppColors.texts)),
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              DropdownButtonFormField(
                dropdownColor: AppColors.backgroundTextFiel,
                hint: Text("Seleccione los meses", style: TextStyle(color: AppColors.texts)),
                items: optionsMonths.map((String option){
                return DropdownMenuItem<String>(
                  value:option,
                  child: Text(option, style: TextStyle(color: AppColors.texts)));
              }).toList(), onChanged: (String? newOption){
                setState(() {
                  optionSelectedMonths = newOption;
                });
              }),
            
              SizedBox(height: 40),
             Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                onPressed: () {
                  // Aquí puedes agregar la lógica para añadir el cliente
                  // Por ejemplo, llamar a un método que envíe los datos al servidor
                  String name = _nameController.text;
                  String email = _emailController.text;
                  String phone = _phoneController.text;
                  String address = _addressController.text;
                  String membership = optionSelected ?? '';
                  String lastVisit = optionSelectedMonths ?? '';

                  int membershipDuration = lastVisit.isNotEmpty ? int.parse(lastVisit.split(' ')[0]) : 0;


                  if(name.isEmpty || email.isEmpty || phone.isEmpty || address.isEmpty || membership.isEmpty || lastVisit.isEmpty) {
                    // Mostrar un mensaje de error si algún campo está vacío
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Por favor, complete todos los campos'))
                    );
                    return;
                  }
                  context.read<AddClientCubit>().addClient(
                    name,
                    email,
                    phone,
                    address,
                    membership,
                    membershipDuration
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Registro exitoso')),
                    );
                  

                  Navigator.pop(context,true);

                  //print('Cliente añadido: $name, $email, $phone, $address, $membership, $membershipDuration');
                },
              
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.buttonBackground,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: const Text(
                  'Añadir cliente',
                  style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              ],
             )
          ],
        )
      )
    );
  }
}
