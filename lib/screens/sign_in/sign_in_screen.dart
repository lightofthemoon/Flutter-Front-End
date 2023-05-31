import 'package:flutter/material.dart';
import 'package:quanlyquantrasua/screens/sign_in/components/body.dart';
import 'package:quanlyquantrasua/widgets/custom_widgets/custom_appbar.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = "/sign_in";
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        showLeading: false,
        title: 'Đăng nhập',
      ),
      body: Body(),
    );
  }
}
