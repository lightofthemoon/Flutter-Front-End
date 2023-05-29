import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quanlyquantrasua/screens/sign_in/components/customSuffixIcon.dart';
import 'package:quanlyquantrasua/widgets/custom_widgets/messages_widget.dart';
import 'package:quanlyquantrasua/widgets/custom_widgets/password_input.dart';

import '../../../widgets/custom_widgets/default_button.dart';
import '../../../widgets/custom_widgets/form_err.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  bool isShowPass = true;
  // late LoginAccountInfoController controller;
  // late AuthController authController;

  // late GetCartUserController cartController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // controller = Get.put(LoginAccountInfoController());
    // authController = Get.put(AuthController());
    // cartController = Get.put(GetCartUserController());
  }

  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool remember = false;
  final List<String> errors = [];
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(children: [
        buildEmailField(),
        const SizedBox(
          height: 30,
        ),
        buildPasswordField(),
        const SizedBox(
          height: 30,
        ),
        FormError(errors: errors),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            // Obx(
            //   () => Checkbox(
            //     value: authController.isRemember.value,
            //     onChanged: (value) {
            //       setState(() {
            //         authController.isRemember.value = value!;
            //       });
            //     },
            //   ),
            // ),
            const Text('Nhớ mật khẩu'),
            const Spacer(),
            GestureDetector(
              // onTap: () =>
              // Navigator.pushNamed(context, ForgotPasswordScreen.routeName),
              child: const Text(
                'Quên mật khẩu',
                style: TextStyle(decoration: TextDecoration.underline),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        DefaultButton(
          text: 'Đăng nhập',
          press: () {
            CustomSnackBar.showCustomSnackBar(
                context, 'Đăng nhập thành công', 1);
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

  Widget buildPasswordField() {
    return PasswordInput(hintText: 'Nhập mật khẩu');
  }

  Widget buildEmailField() {
    return TextFormField(
      cursorColor: Colors.black,
      decoration: const InputDecoration(
        hintText: 'Enter your username',
        labelText: 'Username',
      ),
    );
  }
}
