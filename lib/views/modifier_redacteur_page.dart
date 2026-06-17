import 'package:flutter/material.dart';

import '../controllers/redacteur_controller.dart';
import '../models/redacteur.dart';
import '../widgets/redacteur_formulaire.dart';

class ModifierRedacteurPage extends StatelessWidget {
  const ModifierRedacteurPage({
    super.key,
    required this.controller,
    required this.redacteur,
  });

  final RedacteurController controller;
  final Redacteur redacteur;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: RedacteurFormulaire(
        redacteur: redacteur,
        onEnregistrer: ({required nom, required specialite}) async {
          await controller.modifierRedacteur(
            Redacteur(id: redacteur.id, nom: nom, specialite: specialite),
          );

          if (!context.mounted) {
            return;
          }

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Redacteur modifie avec succes')),
          );
          Navigator.pop(context);
        },
      ),
    );
  }
}
