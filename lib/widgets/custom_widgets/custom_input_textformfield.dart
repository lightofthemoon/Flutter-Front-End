// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

<<<<<<< HEAD
import '../../configs/mediaquery.dart';

=======
>>>>>>> dat
class CustomInputTextField extends StatefulWidget {
  const CustomInputTextField({
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
  _CustomInputTextFieldState createState() => _CustomInputTextFieldState();
}

class _CustomInputTextFieldState extends State<CustomInputTextField> {
  late TextEditingController _controller;
  late String? _errorText;
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
      controller: _controller,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        hintText: widget.hintText,
        labelText: widget.labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        errorText: _errorText,
      ),
    );
  }
}

// class TextInputWidget extends StatelessWidget {
//   final String hintText;
//   final TextEditingController controller;
//   final ValueChanged<String>? onChanged;
//   final FocusNode? focusNode;
//   final FocusNode? nextFocusNode;

//   const TextInputWidget({
//     Key? key,
//     required this.hintText,
//     required this.controller,
//     this.onChanged,
//     this.focusNode,
//     this.nextFocusNode,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(
//         top: mediaAspectRatio(context, 0.5),
//         left: screenRotate(context)
//             ? mediaAspectRatio(context, 0.03)
//             : mediaAspectRatio(context, 0.05),
//         right: screenRotate(context)
//             ? mediaAspectRatio(context, 0.03)
//             : mediaAspectRatio(context, 0.05),
//       ),
//       child: Row(
//         mainAxisSize: MainAxisSize.max,
//         children: <Widget>[
//           Flexible(
//             child: TextField(
//               controller: controller,
//               decoration: InputDecoration(
//                 hintText: hintText,
//               ),
//               onChanged: onChanged,
//               focusNode: focusNode,
//               onSubmitted: (value) {
//                 focusNode?.unfocus();
//                 if (nextFocusNode != null) {
//                   FocusScope.of(context).requestFocus(nextFocusNode);
//                 }
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
