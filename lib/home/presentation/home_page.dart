import 'package:flutter/material.dart';
import 'package:frontend_flutter/clientDetails/presentation/client_datails_page.dart';
import 'package:frontend_flutter/core/colors/app_colors.dart';
import 'package:frontend_flutter/core/navigation/app_navigation_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> users = ['Juan', 'María', 'Carlos', 'Luisa'];
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
            onPressed: () {},
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
                        child: Column(
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
                              "120",
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
              child: ListView.builder(itemCount: users.length,itemBuilder: (context,index){
              final user = users[index];
              return ListTile(
                title: Text(user, style: TextStyle(color: Colors.white, fontSize: 18)),
                subtitle: Text("Nuevo registro",style: TextStyle(
                  color: AppColors.texts
                ),),
                leading: Icon(Icons.person),
                onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context) =>ClientDetailsPage()));
                },
              );
            }),
            )
          ],
        ),
      ),
      bottomNavigationBar: AppNavigationBar(),
    );
    
  }
}
