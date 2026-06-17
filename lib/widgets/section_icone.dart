import 'package:flutter/material.dart';

class SectionIcone extends StatelessWidget {
  const SectionIcone({
    super.key,
    required this.icone,
    required this.titre,
    required this.sousTitre,
  });

  final IconData icone;
  final String titre;
  final String sousTitre;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(child: Icon(icone)),
      title: Text(titre),
      subtitle: Text(sousTitre),
    );
  }
}
