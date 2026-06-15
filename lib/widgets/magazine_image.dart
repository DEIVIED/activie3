import 'package:flutter/material.dart';

class MagazineImage extends StatelessWidget {
  const MagazineImage({super.key, required this.imagePath});

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Image.asset(imagePath);
  }
}
