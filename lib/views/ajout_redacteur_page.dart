import 'package:flutter/material.dart';

import '../controllers/redacteur_controller.dart';
import '../widgets/redacteur_formulaire.dart';

class AjoutRedacteurPage extends StatelessWidget {
  const AjoutRedacteurPage({
    super.key,
    required this.controller,
    required this.onEnregistre,
  });

  final RedacteurController controller;
  final VoidCallback onEnregistre;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: RedacteurFormulaire(
        onEnregistrer: ({required nom, required specialite}) async {
          await controller.ajouterRedacteur(nom: nom, specialite: specialite);

          if (!context.mounted) {
            return;
          }

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Redacteur ajoute avec succes')),
          );
          onEnregistre();
        },
      ),
    );
  }
}
