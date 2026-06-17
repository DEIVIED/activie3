import 'package:flutter/material.dart';

class SectionTitre extends StatelessWidget {
  const SectionTitre({super.key, required this.titre});

  final String titre;

  @override
  Widget build(BuildContext context) {
    return Text(
      titre,
      style: Theme.of(
        context,
      ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    );
  }
}
