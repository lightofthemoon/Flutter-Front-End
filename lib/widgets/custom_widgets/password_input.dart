import 'package:flutter/material.dart';

class CustomPasswordTextfield extends StatefulWidget {
  const CustomPasswordTextfield({
    Key? key,
    this.hintText,
    this.focusNode,
    this.nextfocusNode,
    this.labelText,
    this.validator,
    required this.controller,
    this.onChanged,
  }) : super(key: key);
  final String? Function(String?)? validator;
  final Function(String?)? onChanged;
  final String? hintText;

  final String? labelText;
  final FocusNode? focusNode;
  final FocusNode? nextfocusNode;
  final TextEditingController controller;
  @override
  _CustomPasswordTextfieldState createState() =>
      _CustomPasswordTextfieldState();
}

class _CustomPasswordTextfieldState extends State<CustomPasswordTextfield> {
  late TextEditingController _controller;
  late String? _errorText;
  bool _passwordVisible = false;
  @override
  void initState() {
    super.initState();
    _controller = widget.controller;
    _errorText = '';
  }

  void checkOnchangedValidate(String? value) {
    setState(() {
      _errorText = widget.onChanged?.call(value);
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
      validator: widget.validator,
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
