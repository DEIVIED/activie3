import 'package:flutter/material.dart';

class SectionTexte extends StatelessWidget {
  const SectionTexte({super.key, required this.texte});

  final String texte;

  @override
  Widget build(BuildContext context) {
    return Text(
      texte,
      style: Theme.of(context).textTheme.bodyLarge,
      textAlign: TextAlign.center,
    );
  }
}
