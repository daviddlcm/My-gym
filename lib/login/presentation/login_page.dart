import 'package:flutter/material.dart';
import 'package:frontend_flutter/core/colors/app_colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              Text("Gestor de gimnasio",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,),
              const SizedBox(height: 40),
              const Text(
                'Bienvienido de nuevo',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              TextFormField(
                style: TextStyle(
                  color: AppColors.texts
                ),
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: AppColors.backgroundTextFiel,
                  labelText: 'Correo electrónico',
                  labelStyle: TextStyle(color: AppColors.texts),
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    borderSide: BorderSide.none,
                  )
                  
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),
              TextFormField(
                style: TextStyle(
                  color: AppColors.texts
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.backgroundTextFiel,
                  labelText: 'Contraseña',
                  labelStyle: const TextStyle(color: AppColors.texts),
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
                   border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    borderSide: BorderSide.none,
                  ),
                ),
                obscureText: _obscureText,
              ),
              const SizedBox(height: 20),
              Text("¿Olvidaste tu contraseña?",
                style: TextStyle(
                  color: AppColors.texts,
                  fontSize: 14,
                ),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.buttonBackground,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: const Text(
                  'Iniciar Sesión',
                  style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              Spacer(),
              Text("¿No tienes una cuenta? Regístrate",
                style: TextStyle(
                  color: AppColors.texts,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
} 