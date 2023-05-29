import 'package:flutter/material.dart';
import 'package:quanlyquantrasua/configs/constant.dart';
import 'package:quanlyquantrasua/screens/sign_in/sign_in_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quanlyquantrasua/widgets/custom_widgets/gender_chose.dart';
import '../../../widgets/custom_widgets/default_button.dart';
import '../../../widgets/custom_widgets/transition.dart';

class SignUpCompleteForm extends StatelessWidget {
  const SignUpCompleteForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(children: [
        buildFullNameField(),
        const SizedBox(
          height: 30,
        ),
        buildPhoneNumberField(),
        const SizedBox(
          height: 30,
        ),
        GenderSelectionWidget(
          gender: 'Nam',
          size: 1.7,
        ),
        buildAddressField(),
        const SizedBox(
          height: 30,
        ),
        buildBirthDayField(),
        const SizedBox(
          height: 20,
        ),
        DefaultButton(
          text: 'Tiếp tục',
          press: () {
            slideinTransition(context, const SignInScreen());
          },
        )
      ]),
    );
  }
}

TextFormField buildFullNameField() {
  return TextFormField(
    cursorColor: Colors.black,
    decoration: const InputDecoration(
      hintText: 'Nhập họ và tên',
      labelText: 'Họ và tên',
    ),
  );
}

TextFormField buildBirthDayField() {
  return TextFormField(
    cursorColor: Colors.black,
    decoration: InputDecoration(
      hintText: 'Nhập ngày sinh',
      labelText: 'Ngày sinh',
      helperText: 'Ngày sinh phải có định dạng là ngày/tháng/năm',
      helperStyle: kHelperTextStyle,
    ),
  );
}

TextFormField buildPhoneNumberField() {
  return TextFormField(
    cursorColor: Colors.black,
    decoration: const InputDecoration(
      hintText: 'Nhập số điện thoại',
      labelText: 'Số điện thoại',
    ),
  );
}

TextFormField buildAddressField() {
  return TextFormField(
    cursorColor: Colors.black,
    decoration: const InputDecoration(
      hintText: 'Nhập địa chỉ',
      labelText: 'Địa chỉ',
    ),
  );
}
