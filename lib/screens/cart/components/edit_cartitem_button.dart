import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditCartItemButton extends StatefulWidget {
  final VoidCallback onTap;
  final bool? isEnabled;
  const EditCartItemButton({
    super.key,
    required this.onTap,
    this.isEnabled = true,
  });

  @override
  State<EditCartItemButton> createState() => _EditCartItemButtonState();
}

class _EditCartItemButtonState extends State<EditCartItemButton> {
  bool isIconPressed = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
      height: MediaQuery.of(context).size.height / 24,
      width: MediaQuery.of(context).size.height / 14,
      child: InkWell(
        onTapDown: (_) {
          setState(() {
            isIconPressed = true;
          });
        },
        onTapUp: (_) {
          setState(() {
            isIconPressed = false;
          });
        },
        onTapCancel: () {
          setState(() {
            isIconPressed = false;
          });
        },
        onTap: widget.isEnabled! ? widget.onTap : null,
        splashColor: Colors.white,
        child: Row(
          children: [
            Icon(
              CupertinoIcons.pencil,
              key: const ValueKey<Color>(Colors.black),
              color: widget.isEnabled!
                  ? Colors.green
                  : Colors.black, // Only change color if isEnabled is true
            ),
            const Text(
              'Sửa',
              style: TextStyle(fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}
