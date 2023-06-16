import 'package:flutter/material.dart';

class CustomPasswordTextfield extends StatefulWidget {
  const CustomPasswordTextfield({
    Key? key,
    this.hintText,
    this.focusNode,
    this.nextfocusNode,
    this.labelText,
    required this.controller,
    this.onChanged,
  }) : super(key: key);
  final Function(String?)? onChanged;
  final String? hintText;

  final String? labelText;
  final FocusNode? focusNode;
  final FocusNode? nextfocusNode;
  final TextEditingController controller;
  @override
  CustomPasswordTextfieldState createState() => CustomPasswordTextfieldState();
}

class CustomPasswordTextfieldState extends State<CustomPasswordTextfield> {
  late TextEditingController _controller;
  String? _errorText;
  bool _passwordVisible = false;
  @override
  void initState() {
    super.initState();
    _controller = widget.controller;
  }

  void checkOnchangedValidate(String? value) {
    setState(() {
      if (value != '' || value != null) {
        _errorText = widget.onChanged?.call(value);
      } else {
        _errorText = null;
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: widget.focusNode,
      onFieldSubmitted: (value) {
        if (widget.nextfocusNode != null) {
          widget.focusNode?.unfocus();
          FocusScope.of(context).requestFocus(widget.nextfocusNode);
        }
      },
      onChanged: checkOnchangedValidate,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: !_passwordVisible,
      controller: _controller,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        hintText: widget.hintText,
        labelText: widget.labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        suffixIcon: IconButton(
          icon:
              Icon(_passwordVisible ? Icons.visibility : Icons.visibility_off),
          onPressed: () {
            setState(() {
              _passwordVisible = !_passwordVisible;
            });
          },
        ),
        errorText: _errorText,
      ),
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.done,
    );
  }
}
