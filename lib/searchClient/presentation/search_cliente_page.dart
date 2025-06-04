import 'package:flutter/material.dart';
import 'package:frontend_flutter/addClient/presentation/add_client_page.dart';
import 'package:frontend_flutter/core/colors/app_colors.dart';

class SearchClientPage extends StatefulWidget {
  const SearchClientPage({super.key});

  @override
  State<SearchClientPage> createState() => _SearchClientPageState();
}

class _SearchClientPageState extends State<SearchClientPage> {
  List<String> users = ['Juan', 'María', 'Carlos', 'Luisa'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        centerTitle: true,
        title: Text(
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
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextFormField(
              style: TextStyle(color: AppColors.texts),
              decoration: InputDecoration(
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
              child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  return ListTile(
                    title: Text(
                      user,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    subtitle: Text(
                      "Nuevo registro",
                      style: TextStyle(color: AppColors.texts),
                    ),
                    leading: Icon(Icons.person),
                    onTap: () {},
                  );
                },
              ),
            ),
            
          ],
        ),
        
      ),
      floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => AddClientPage(),
                ));
              },
              backgroundColor: AppColors.primary,
              child: Icon(Icons.add,size: 40, color: Colors.white),
        ),
    );
  }
}
