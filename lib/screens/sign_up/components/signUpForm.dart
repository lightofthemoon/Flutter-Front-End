import 'package:flutter/material.dart';
import 'package:quanlyquantrasua/screens/sign_up/sign_up_complete_screen.dart';
import 'package:quanlyquantrasua/widgets/custom_widgets/transition.dart';

import '../../../configs/constant.dart';

import '../../../widgets/custom_widgets/default_button.dart';
import '../../../widgets/custom_widgets/form_err.dart';
import '../../sign_in/components/customSuffixIcon.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(children: [
        BuildUsername(),
        const SizedBox(
          height: 20,
        ),
        BuildFormPassword(),
        const SizedBox(
          height: 20,
        ),
        BuildConfirmPassword(),
        const SizedBox(
          height: 40,
        ),
        DefaultButton(
          text: 'Tiếp tục',
          press: () {
            slideinTransition(context, const SignUpCompleteScreen());
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
}

TextFormField BuildUsername() {
  return TextFormField(
    cursorColor: Colors.black,
    decoration: const InputDecoration(
      hintText: 'Enter your username',
      labelText: 'Username',
      // suffixIcon: CustomSuffix(
      //   svgIcon: 'assets/icons/User.svg',
      // )
    ),
  );
}

TextFormField BuildConfirmPassword() {
  return TextFormField(
    obscureText: true,
    cursorColor: Colors.black,
    decoration: const InputDecoration(
      hintText: 'Re-enter your password',
      labelText: 'Confirm password',
    ),
  );
}

TextFormField BuildFormPassword() {
  return TextFormField(
    obscureText: true,
    cursorColor: Colors.black,
    decoration: const InputDecoration(
      hintText: 'Enter your password',
      labelText: 'Password',
    ),
  );
}
