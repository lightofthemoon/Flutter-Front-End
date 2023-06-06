import 'package:flutter/material.dart';

<<<<<<< HEAD
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
=======
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
>>>>>>> dat
    );
  }
}
