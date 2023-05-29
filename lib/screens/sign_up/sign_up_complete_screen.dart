import 'package:flutter/material.dart';

import '../../widgets/custom_widgets/custom_appbar.dart';
import 'components/sign_up_complete_body.dart';

class SignUpCompleteScreen extends StatelessWidget {
  static String routeName = "/sign_in";
  const SignUpCompleteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        onPressed: () {
          Navigator.pop(context);
        },
        title: 'Đăng ký',
      ),
      body: const SignUpCompleteBody(),
    );
  }
}
