import 'package:flutter/material.dart';

import '../controllers/redacteur_controller.dart';
import '../models/redacteur.dart';

class SupprimerRedacteurPage extends StatelessWidget {
  const SupprimerRedacteurPage({
    super.key,
    required this.controller,
    required this.redacteur,
  });

  final RedacteurController controller;
  final Redacteur redacteur;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Supprimer le redacteur'),
      content: Text('Confirmer la suppression de ${redacteur.nom} ?'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Annuler'),
        ),
        FilledButton.icon(
          onPressed: redacteur.id == null
              ? null
              : () async {
                  await controller.supprimerRedacteur(redacteur.id!);

                  if (!context.mounted) {
                    return;
                  }

                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Redacteur supprime avec succes'),
                    ),
                  );
                },
          icon: const Icon(Icons.delete),
          label: const Text('Supprimer'),
        ),
      ],
    );
  }
}
