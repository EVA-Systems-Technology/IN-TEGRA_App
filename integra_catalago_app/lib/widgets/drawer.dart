import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFF2D3078);

    return Drawer(
      backgroundColor: primaryColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: primaryColor),
            child: Center(
              child: Text(
                'IN-TEGRA',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Alexandria',
                ),
              ),
            ),
          ),

          ListTile(
            leading: const Icon(Icons.home, color: Colors.white),
            title: const Text(
              'Home',
              style: TextStyle(color: Colors.white, fontFamily: 'Alexandria'),
            ),
            onTap: () {
              // Apenas fecha o drawer
              Navigator.pop(context);
            },
          ),

          ListTile(
            leading: const Icon(Icons.accessible, color: Colors.white),
            title: const Text(
              'Deficiências',
              style: TextStyle(color: Colors.white, fontFamily: 'Alexandria'),
            ),
            onTap: () {
              Navigator.pop(context); // Fecha o drawer
              Navigator.pushNamed(context, '/deficiencias');
            },
          ),

          ListTile(
            leading: const Icon(Icons.folder_copy, color: Colors.white),
            title: const Text(
              'Categorias',
              style: TextStyle(color: Colors.white, fontFamily: 'Alexandria'),
            ),
            onTap: () {
              Navigator.pop(context); // Fecha o drawer
              Navigator.pushNamed(context, '/categorias');
            },
          ),
        ],
      ),
    );
  }
}
