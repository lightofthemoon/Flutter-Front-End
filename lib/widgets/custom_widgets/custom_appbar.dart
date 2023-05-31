import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool showLeading;
  final VoidCallback? onPressed;
  const CustomAppBar(
      {super.key, this.title, this.showLeading = true, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.green,
      elevation: 0,
      centerTitle: true,
      leading: showLeading
          ? IconButton(
              icon:
                  const Icon(Icons.arrow_back_ios_rounded, color: Colors.black),
              onPressed: onPressed,
            )
          : null,
      title: Text(
        title ?? "",
        style: const TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
