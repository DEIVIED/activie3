import 'package:flutter/material.dart';

class MenuNavigation extends StatelessWidget {
  const MenuNavigation({
    super.key,
    required this.onAccueilSelected,
    required this.onAjoutRedacteurSelected,
    required this.onListeRedacteursSelected,
  });

  final VoidCallback onAccueilSelected;
  final VoidCallback onAjoutRedacteurSelected;
  final VoidCallback onListeRedacteursSelected;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.pink),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Accueil'),
            onTap: () {
              Navigator.pop(context);
              onAccueilSelected();
            },
          ),
          ListTile(
            leading: const Icon(Icons.person_add),
            title: const Text('Ajouter un redacteur'),
            onTap: () {
              Navigator.pop(context);
              onAjoutRedacteurSelected();
            },
          ),
          ListTile(
            leading: const Icon(Icons.people),
            title: const Text('Liste des redacteurs'),
            onTap: () {
              Navigator.pop(context);
              onListeRedacteursSelected();
            },
          ),
        ],
      ),
    );
  }
}
