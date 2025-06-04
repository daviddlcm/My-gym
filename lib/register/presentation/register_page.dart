import 'package:flutter/material.dart';
import 'package:frontend_flutter/core/colors/app_colors.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        
        backgroundColor: AppColors.primary,
        iconTheme: IconThemeData(
          color: AppColors.texts,
          
        ),
        
      ),
      backgroundColor: AppColors.primary,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children:[
              const SizedBox(height: 30,),
              Text("Crea tu cuenta",
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,),
              const SizedBox(height: 30,),
              TextFormField(
                style: TextStyle(
                  color: AppColors.texts
                ),
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: AppColors.backgroundTextFiel,
                  labelText: 'Nombre completo',
                  labelStyle: TextStyle(color: AppColors.texts),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    borderSide: BorderSide.none,
                  )
                  
                )
              ),
              const SizedBox(height: 30),
              TextFormField(
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
                  
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 30),
              TextFormField(
                style: TextStyle(
                  color: AppColors.texts
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.backgroundTextFiel,
                  labelText: 'Contraseña',
                  labelStyle: const TextStyle(color: AppColors.texts),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    borderSide: BorderSide.none,
                  ),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 30),
              TextFormField(
                style: TextStyle(
                  color: AppColors.texts
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.backgroundTextFiel,
                  labelText: 'Confirmar contraseña',
                  labelStyle: const TextStyle(color: AppColors.texts),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    borderSide: BorderSide.none,
                  ),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.buttonBackground,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: const Text(
                  'Registrarse',
                  style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20),
              Text("Al registrarte, aceptas nuestros Términos de servicio y Política de privacidad.", style: TextStyle(
                color: AppColors.texts,
                fontSize: 15,

              ),
              textAlign: TextAlign.center,),
              Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "¿Ya tienes una cuenta? Inicia sesión",
                  style: TextStyle(
                    color: AppColors.texts,
                    fontSize: 14,
                    decoration: TextDecoration.underline,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ]
          ),
        ),
      ),
    );;
  }
}