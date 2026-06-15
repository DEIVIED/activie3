import 'package:flutter/material.dart';

class MagazineAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MagazineAppBar({
    super.key,
    required this.title,
    required this.onMenuPressed,
    required this.onSearchPressed,
  });

  final String title;
  final VoidCallback onMenuPressed;
  final VoidCallback onSearchPressed;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: onMenuPressed,
      ),
      actions: [
        IconButton(icon: const Icon(Icons.search), onPressed: onSearchPressed),
      ],
    );
  }
}
