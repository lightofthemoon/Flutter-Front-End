import 'package:flutter/material.dart';
<<<<<<< HEAD
=======
import 'package:quanlyquantrasua/widgets/custom_widgets/transition.dart';
>>>>>>> dat

import '../../configs/constant.dart';
import '../../screens/sign_up/signUpScreen.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Bạn chưa có tài khoản?',
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(
          width: 5,
        ),
        GestureDetector(
          onTap: () {
<<<<<<< HEAD
            Navigator.pushNamed(context, SignUpScreen.routeName);
=======
            slideinTransition(context, const SignUpScreen());
>>>>>>> dat
          },
          child: const Text(
            'Đăng ký',
            style: TextStyle(fontSize: 16, color: kPrimaryColor),
          ),
        )
      ],
    );
  }
}
