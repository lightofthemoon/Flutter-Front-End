import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:quanlyquantrasua/widgets/custom_widgets/messages_widget.dart';
import 'package:quanlyquantrasua/widgets/custom_widgets/password_input.dart';

=======
import 'package:get/get.dart';
import 'package:quanlyquantrasua/controller/account_controller.dart';
import 'package:quanlyquantrasua/model/account_model.dart';

import 'package:quanlyquantrasua/screens/home/home_screens.dart';
import 'package:quanlyquantrasua/widgets/custom_widgets/custom_input_textformfield.dart';
import 'package:quanlyquantrasua/widgets/custom_widgets/messages_widget.dart';
import 'package:quanlyquantrasua/widgets/custom_widgets/password_input.dart';
import 'package:quanlyquantrasua/widgets/custom_widgets/transition.dart';

import '../../../api/account_api/account_api.dart';
>>>>>>> dat
import '../../../widgets/custom_widgets/default_button.dart';
import '../../../widgets/custom_widgets/form_err.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  bool isShowPass = true;
<<<<<<< HEAD
  // late LoginAccountInfoController controller;
  // late AuthController authController;

  // late GetCartUserController cartController;
=======
  late TextEditingController emailController;
  late TextEditingController passwordController;
  bool isValidEmail = false;
  bool isValidPassword = false;
  final controller = Get.find<AccountApi>();
  // late AuthController authController;

  // late GetCartUserController cartController;

>>>>>>> dat
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
<<<<<<< HEAD
=======
    emailController = TextEditingController();
    passwordController = TextEditingController();
>>>>>>> dat
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
<<<<<<< HEAD
        buildEmailField(),
        const SizedBox(
          height: 30,
        ),
        buildPasswordField(),
=======
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
            labelText: 'Email',
            hintText: 'Nhập email',
            controller: emailController),
        const SizedBox(
          height: 30,
        ),
        CustomPasswordTextfield(
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
                isValidPassword = _validatePassword(value ?? '');
              });
            },
            labelText: 'Mật khẩu',
            hintText: 'Nhập mật khẩu',
            controller: passwordController),
>>>>>>> dat
        const SizedBox(
          height: 30,
        ),
        FormError(errors: errors),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
<<<<<<< HEAD
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
=======
            const Text('Nhớ mật khẩu'),
            const Spacer(),
            GestureDetector(
              onTap: () {},
>>>>>>> dat
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
<<<<<<< HEAD
          text: 'Đăng nhập',
          press: () {
            CustomSnackBar.showCustomSnackBar(
                context, 'Đăng nhập thành công', 1);
=======
          enabled: isValidEmail && isValidPassword,
          text: 'Đăng nhập',
          press: () async {
            Accounts accounts = Accounts();
            accounts.email = emailController.text;
            accounts.password = passwordController.text;
            await controller.login(accounts.loginToJson()).then((value) {
              if (value.status == 'Success') {
                AccountController().storedUserToSharedRefererces(value);
                CustomSnackBar.showCustomSnackBar(
                    context, 'Đăng nhập thành công!', 2);
                slideinTransitionNoBack(context, const HomeScreenView());
              } else {
                CustomSnackBar.showCustomSnackBar(
                    context, 'Đăng nhập thất bại! \nLỗi: ${value.status}', 1,
                    backgroundColor: Colors.red);
              }
            });

>>>>>>> dat
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

<<<<<<< HEAD
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
=======
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
>>>>>>> dat
  }
}
