import 'package:flutter/material.dart';
import 'package:frontend_flutter/core/colors/app_colors.dart';
import 'package:frontend_flutter/home/presentation/home_page.dart';
import 'package:frontend_flutter/searchClient/presentation/search_cliente_page.dart';

class AppNavigationBar extends StatelessWidget {
  final int currentIndex;

  const AppNavigationBar({super.key, this.currentIndex = 0});

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      backgroundColor: AppColors.backgroundNav,
      selectedIndex: currentIndex,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      onDestinationSelected: (int index) {
        switch (index) {
          case 0:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );

            break;
          case 1:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SearchClientPage()),
            );
            break;
        }
      },
      destinations: const <NavigationDestination>[
        NavigationDestination(icon: Icon(Icons.home), label: "Inicio"),
        NavigationDestination(icon: Icon(Icons.search), label: 'Clientes'),
        // NavigationDestination(
        //   selectedIcon: Icon(Icons.bookmark),
        //   icon: Icon(Icons.bookmark_border),
        //   label: 'Guardados',
        // ),
      ],
    );
  }
}
