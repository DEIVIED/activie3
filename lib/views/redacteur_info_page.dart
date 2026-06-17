import 'package:flutter/material.dart';

import '../controllers/redacteur_controller.dart';
import '../models/redacteur.dart';
import 'modifier_redacteur_page.dart';
import 'supprimer_redacteur_page.dart';

class RedacteurInfoPage extends StatelessWidget {
  const RedacteurInfoPage({super.key, required this.controller});

  final RedacteurController controller;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Redacteur>>(
      stream: controller.listerRedacteurs(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('Erreur : ${snapshot.error}'));
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        final redacteurs = snapshot.data ?? [];

        if (redacteurs.isEmpty) {
          return const Center(child: Text('Aucun redacteur enregistre'));
        }

        return ListView.separated(
          padding: const EdgeInsets.all(12),
          itemCount: redacteurs.length,
          separatorBuilder: (context, index) => const Divider(height: 1),
          itemBuilder: (context, index) {
            final redacteur = redacteurs[index];

            return ListTile(
              leading: const CircleAvatar(child: Icon(Icons.edit_note)),
              title: Text(redacteur.nom),
              subtitle: Text(redacteur.specialite),
              trailing: Wrap(
                spacing: 4,
                children: [
                  IconButton(
                    tooltip: 'Modifier',
                    icon: const Icon(Icons.edit),
                    onPressed: () => _ouvrirModification(context, redacteur),
                  ),
                  IconButton(
                    tooltip: 'Supprimer',
                    icon: const Icon(Icons.delete),
                    onPressed: () => _confirmerSuppression(context, redacteur),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _ouvrirModification(BuildContext context, Redacteur redacteur) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(title: const Text('Modifier un redacteur')),
          body: ModifierRedacteurPage(
            controller: controller,
            redacteur: redacteur,
          ),
        ),
      ),
    );
  }

  void _confirmerSuppression(BuildContext context, Redacteur redacteur) {
    showDialog<void>(
      context: context,
      builder: (context) =>
          SupprimerRedacteurPage(controller: controller, redacteur: redacteur),
    );
  }
}
