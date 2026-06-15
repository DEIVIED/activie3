import 'package:flutter/material.dart';

import '../models/utilisateur.dart';

class UtilisateurFormulaire extends StatefulWidget {
  const UtilisateurFormulaire({
    super.key,
    this.utilisateur,
    required this.onEnregistrer,
  });

  final Utilisateur? utilisateur;
  final void Function({
    Utilisateur? utilisateur,
    required String fullname,
    required String email,
  })
  onEnregistrer;

  @override
  State<UtilisateurFormulaire> createState() => _UtilisateurFormulaireState();
}

class _UtilisateurFormulaireState extends State<UtilisateurFormulaire> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _fullnameController;
  late final TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _initialiserControllers();
  }

  @override
  void didUpdateWidget(covariant UtilisateurFormulaire oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.utilisateur?.id != widget.utilisateur?.id) {
      _fullnameController.text = widget.utilisateur?.fullname ?? '';
      _emailController.text = widget.utilisateur?.email ?? '';
    }
  }

  @override
  void dispose() {
    _fullnameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final estModification = widget.utilisateur != null;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _fullnameController,
              decoration: const InputDecoration(
                labelText: 'Fullname',
                border: OutlineInputBorder(),
              ),
              validator: _champObligatoire,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
              validator: _champObligatoire,
            ),
            const SizedBox(height: 16),
            FilledButton.icon(
              onPressed: _soumettre,
              icon: Icon(estModification ? Icons.save : Icons.person_add),
              label: Text(estModification ? 'Modifier' : 'Ajouter'),
            ),
          ],
        ),
      ),
    );
  }

  void _initialiserControllers() {
    _fullnameController = TextEditingController(
      text: widget.utilisateur?.fullname ?? '',
    );
    _emailController = TextEditingController(
      text: widget.utilisateur?.email ?? '',
    );
  }

  String? _champObligatoire(String? valeur) {
    if (valeur == null || valeur.trim().isEmpty) {
      return 'Ce champ est obligatoire';
    }
    return null;
  }

  void _soumettre() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    widget.onEnregistrer(
      utilisateur: widget.utilisateur,
      fullname: _fullnameController.text.trim(),
      email: _emailController.text.trim(),
    );
  }
}
