import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quanlyquantrasua/api/account_api/account_api.dart';
import 'package:quanlyquantrasua/screens/sign_up/sign_up_complete_screen.dart';
import 'package:quanlyquantrasua/widgets/custom_widgets/custom_input_textformfield.dart';
import 'package:quanlyquantrasua/widgets/custom_widgets/transition.dart';

import '../../../widgets/custom_widgets/default_button.dart';

class SignUpForm extends StatefulWidget {
  SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final controller = Get.find<AccountController>();

  late TextEditingController emailController;

  late TextEditingController passwordController;

  late TextEditingController reenterpassController;
  bool isValidEmail = false;
  bool isValidPassword = false;
  bool isValidReenterPassword = false;
  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    reenterpassController = TextEditingController();
    emailController.addListener(() {
      setState(() {
        isValidEmail = _validateEmail(emailController.text);
      });
    });
    passwordController.addListener(() {
      setState(() {
        isValidPassword = _validatePassword(passwordController.text);
      });
    });
    reenterpassController.addListener(() {
      setState(() {
        isValidReenterPassword = _validateReenterPassword(
            passwordController.text, reenterpassController.text);
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  final emailFocusNode = FocusNode();

  final passwordFocusNode = FocusNode();

  final reenterpassFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(children: [
        CustomInputTextField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                isValidEmail = false;

                return 'Email không được trống';
              }

              isValidEmail = true;

              return null;
            },
            onChanged: (value) {
              setState(() {
                isValidEmail = _validateEmail(value ?? '');
              });
            },
            controller: emailController,
            focusNode: emailFocusNode,
            nextfocusNode: passwordFocusNode,
            labelText: 'Email',
            hintText: 'Nhập Email'),
        const SizedBox(
          height: 20,
        ),
        CustomInputTextField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                isValidPassword = false;

                return 'Bạn chưa nhập mật khẩu';
              }

              isValidPassword = true;

              return null;
            },
            onChanged: (value) {
              setState(() {
                isValidEmail = _validatePassword(value ?? '');
              });
            },
            controller: passwordController,
            focusNode: passwordFocusNode,
            nextfocusNode: reenterpassFocusNode,
            labelText: 'Mật khẩu',
            hintText: 'Nhập mật khẩu'),
        const SizedBox(
          height: 20,
        ),
        CustomInputTextField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                isValidReenterPassword = false;

                return 'Bạn phải xác nhận mật khẩu';
              }
              isValidReenterPassword = true;
              return null;
            },
            onChanged: (value) {
              setState(() {
                isValidEmail =
                    _validateReenterPassword(value, reenterpassController.text);
              });
            },
            controller: reenterpassController,
            focusNode: reenterpassFocusNode,
            nextfocusNode: null,
            labelText: 'Xác nhận mật khẩu',
            hintText: 'Nhập lại mật khẩu'),
        const SizedBox(
          height: 40,
        ),
        DefaultButton(
          enabled: isValidEmail && isValidPassword && isValidReenterPassword,
          text: 'Tiếp tục',
          press: () {
            slideinTransition(
                context,
                SignUpCompleteScreen(
                    email: emailController.text,
                    password: passwordController.text));
          },
        )
      ]),
    );
  }

  bool _validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return false;
    }
    return true;
  }

  bool _validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return false;
    }
    return true;
  }

  bool _validateReenterPassword(String? password, String? reenterPassword) {
    if (reenterPassword == null || reenterPassword.isEmpty) {
      return false;
    }
    return true;
  }
}
