import 'package:flutter/material.dart';
import 'package:quanlyquantrasua/screens/sign_in/sign_in_screen.dart';

import '../../../widgets/custom_widgets/default_button.dart';
import '../../../widgets/custom_widgets/transition.dart';

class SignUpCompleteForm extends StatelessWidget {
  const SignUpCompleteForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(children: [
        buildUsernameField(),
        const SizedBox(
          height: 30,
        ),
        buildPasswordField(),
        const SizedBox(
          height: 30,
        ),
        const SizedBox(
          height: 20,
        ),
        DefaultButton(
          text: 'Tiếp tục',
          press: () {
            slideinTransition(context, const SignInScreen());
            // if (_formKey.currentState!.validate() == true) {
            //   _formKey.currentState?.save();
            //   Navigator.pushNamed(context, CompleteProfileScreen.routeName,
            //       arguments: {'username': username, 'password': password});
            // }
          },
        )
      ]),
    );
  }

  TextFormField buildPasswordField() {
    return TextFormField(
      cursorColor: Colors.black,
      decoration: const InputDecoration(
        hintText: 'Enter your password',
        labelText: 'Password',
        // suffixIcon: GestureDetector(
        //   onTap: () {
        //     setState(() {
        //       isShowPass = !isShowPass;
        //     });
        //   },
        // )
      ),
    );
  }

  TextFormField buildUsernameField() {
    return TextFormField(
      cursorColor: Colors.black,
      decoration: const InputDecoration(
        hintText: 'Enter your username',
        labelText: 'Username',
      ),
    );
  }
}
