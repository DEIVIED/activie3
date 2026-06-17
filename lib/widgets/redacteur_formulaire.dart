import 'package:flutter/material.dart';

import '../models/redacteur.dart';

class RedacteurFormulaire extends StatefulWidget {
  const RedacteurFormulaire({
    super.key,
    this.redacteur,
    required this.onEnregistrer,
  });

  final Redacteur? redacteur;
  final void Function({required String nom, required String specialite})
  onEnregistrer;

  @override
  State<RedacteurFormulaire> createState() => _RedacteurFormulaireState();
}

class _RedacteurFormulaireState extends State<RedacteurFormulaire> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nomController;
  late final TextEditingController _specialiteController;

  @override
  void initState() {
    super.initState();
    _nomController = TextEditingController(text: widget.redacteur?.nom ?? '');
    _specialiteController = TextEditingController(
      text: widget.redacteur?.specialite ?? '',
    );
  }

  @override
  void dispose() {
    _nomController.dispose();
    _specialiteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final estModification = widget.redacteur != null;

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller: _nomController,
            decoration: const InputDecoration(
              labelText: 'Nom',
              border: OutlineInputBorder(),
            ),
            textInputAction: TextInputAction.next,
            validator: _champObligatoire,
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _specialiteController,
            decoration: const InputDecoration(
              labelText: 'Specialite',
              border: OutlineInputBorder(),
            ),
            validator: _champObligatoire,
          ),
          const SizedBox(height: 20),
          FilledButton.icon(
            onPressed: _soumettre,
            icon: Icon(estModification ? Icons.save : Icons.person_add),
            label: Text(estModification ? 'Mettre a jour' : 'Enregistrer'),
          ),
        ],
      ),
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
      nom: _nomController.text.trim(),
      specialite: _specialiteController.text.trim(),
    );
  }
}
