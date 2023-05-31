import 'package:flutter/material.dart';

class PasswordInput extends StatefulWidget {
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final FocusNode? focusNode;
  final FocusNode? nextfocusNode;
  final String? helperText;
  final String? hintText;

  PasswordInput({
    this.controller,
    this.onChanged,
    this.onSubmitted,
    this.focusNode,
    this.nextfocusNode,
    this.helperText,
    this.hintText,
  });

  @override
  _PasswordInputState createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.aspectRatio),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Flexible(
            child: TextFormField(
              controller: widget.controller,
              obscureText: !_passwordVisible,
              focusNode: widget.focusNode,
              onFieldSubmitted: (value) {
                widget.focusNode?.unfocus();
                if (widget.nextfocusNode != null) {
                  FocusScope.of(context).requestFocus(widget.nextfocusNode);
                }
              },
              onChanged: widget.onChanged,
              decoration: InputDecoration(
                border: const UnderlineInputBorder(),
                hintText: widget.hintText,
                labelText: 'Password',
                helperText: widget.helperText,
                helperStyle: const TextStyle(
                  color: Color.fromARGB(255, 24, 179, 0),
                ),
                suffixIcon: IconButton(
                  icon: Icon(_passwordVisible
                      ? Icons.visibility
                      : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                ),
              ),
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.done,
              cursorColor: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
