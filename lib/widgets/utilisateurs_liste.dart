import 'package:flutter/material.dart';

import '../models/utilisateur.dart';

class UtilisateursListe extends StatelessWidget {
  const UtilisateursListe({
    super.key,
    required this.utilisateurs,
    required this.onModifier,
    required this.onSupprimer,
  });

  final List<Utilisateur> utilisateurs;
  final ValueChanged<Utilisateur> onModifier;
  final ValueChanged<String> onSupprimer;

  @override
  Widget build(BuildContext context) {
    if (utilisateurs.isEmpty) {
      return const Center(child: Text('Aucun utilisateur ajoute'));
    }

    return ListView.separated(
      padding: const EdgeInsets.all(12),
      itemCount: utilisateurs.length,
      separatorBuilder: (context, index) => const Divider(height: 1),
      itemBuilder: (context, index) {
        final utilisateur = utilisateurs[index];

        return ListTile(
          leading: const CircleAvatar(child: Icon(Icons.person)),
          title: Text(utilisateur.fullname),
          subtitle: Text(utilisateur.email),
          trailing: Wrap(
            spacing: 4,
            children: [
              IconButton(
                tooltip: 'Modifier',
                icon: const Icon(Icons.edit),
                onPressed: () => onModifier(utilisateur),
              ),
              IconButton(
                tooltip: 'Supprimer',
                icon: const Icon(Icons.delete),
                onPressed: utilisateur.id == null
                    ? null
                    : () => onSupprimer(utilisateur.id!),
              ),
            ],
          ),
        );
      },
    );
  }
}
