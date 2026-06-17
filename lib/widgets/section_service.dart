import 'package:flutter/material.dart';

class SectionService extends StatelessWidget {
  const SectionService({
    super.key,
    required this.icone,
    required this.titre,
    required this.description,
  });

  final IconData icone;
  final String titre;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Icon(icone, size: 36, color: Theme.of(context).colorScheme.primary),
            const SizedBox(height: 8),
            Text(
              titre,
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(description, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
