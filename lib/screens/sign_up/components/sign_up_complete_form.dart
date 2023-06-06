<<<<<<< HEAD
// ignore_for_file: use_build_context_synchronously, avoid_print
=======
// ignore_for_file: use_build_context_synchronously
>>>>>>> dd73c3cd0c8237c7ff366b5cd53d449511f67983

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
<<<<<<< HEAD

import 'package:quanlyquantrasua/controller/account_controller.dart';

import 'package:quanlyquantrasua/model/account_model.dart';
=======
import 'package:image_picker/image_picker.dart';

import 'package:quanlyquantrasua/model/account_model.dart';
import 'package:quanlyquantrasua/screens/sign_in/sign_in_screen.dart';
import 'package:quanlyquantrasua/utils/save_image.dart';
>>>>>>> dd73c3cd0c8237c7ff366b5cd53d449511f67983
import 'package:quanlyquantrasua/widgets/custom_widgets/gender_chose.dart';
import 'package:quanlyquantrasua/widgets/custom_widgets/messages_widget.dart';
import '../../../api/account_api/account_api.dart';
import '../../../test/select_image_constant/image_select.dart';
import '../../../widgets/custom_widgets/custom_input_textformfield.dart';
import '../../../widgets/custom_widgets/datetime_picker.dart';
import '../../../widgets/custom_widgets/default_button.dart';
import '../../../widgets/custom_widgets/transition.dart';
import '../../sign_in/sign_in_screen.dart';

class SignUpCompleteForm extends StatefulWidget {
  const SignUpCompleteForm(
      {Key? key, required this.email, required this.password})
      : super(key: key);
  final String email;
  final String password;

  @override
  State<SignUpCompleteForm> createState() => _SignUpCompleteFormState();
}

class _SignUpCompleteFormState extends State<SignUpCompleteForm> {
  final controller = Get.find<AccountApi>();

  late TextEditingController fullNameController;

  late TextEditingController phonenumberController;

  late TextEditingController addressController;
  final fullnameFocusNode = FocusNode();

  final phonenumberFocusNode = FocusNode();

  final addressFocusNode = FocusNode();
  bool isValidFullName = false;
  bool isValidPhoneNumber = false;
  bool isValidAdress = false;
  @override
  void initState() {
    super.initState();
    fullNameController = TextEditingController();
    phonenumberController = TextEditingController();
    addressController = TextEditingController();
    fullNameController.addListener(() {
      setState(() {
        isValidFullName = _validateFullName(fullNameController.text);
      });
    });
    phonenumberController.addListener(() {
      setState(() {
        isValidPhoneNumber = _validatePhoneNumber(phonenumberController.text);
      });
    });
    addressController.addListener(() {
      setState(() {
        isValidAdress = _validateAddress(addressController.text);
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

<<<<<<< HEAD
  File? image;
=======
  XFile? image;
>>>>>>> dd73c3cd0c8237c7ff366b5cd53d449511f67983
  @override
  Widget build(BuildContext context) {
    DateTime? date;
    String? selectedGender;
    return Form(
      child: Column(children: [
        ImagePickerWidget(
          onImageSelected: (value) {
            setState(() {
              image = value;
            });
          },
        ),
        BirthdayDatePickerWidget(
          initialDate: DateTime.now(),
          onChanged: (value) {
            date = value;
          },
        ),
        const SizedBox(
          height: 30,
        ),
        CustomInputTextField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Họ tên không được trống';
            }
            return null;
          },
          onChanged: (value) {
            setState(() {
              isValidFullName = _validateFullName(value);
            });
          },
          controller: fullNameController,
          focusNode: fullnameFocusNode,
          nextfocusNode: phonenumberFocusNode,
          labelText: 'Họ và tên',
          hintText: 'Nhập họ và tên',
        ),
        const SizedBox(
          height: 30,
        ),
        CustomInputTextField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Số điện thoại không được trống';
              }
              return null;
            },
            onChanged: (value) {
              setState(() {
                isValidPhoneNumber = _validatePhoneNumber(value);
              });
            },
            controller: phonenumberController,
            focusNode: phonenumberFocusNode,
            nextfocusNode: addressFocusNode,
            labelText: 'Nhập số điện thoại',
            hintText: 'Số điện thoại'),
        GenderSelectionWidget(
          size: 1.7,
          onChanged: (value) {
            selectedGender = value;
          },
        ),
        CustomInputTextField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Vui lòng nhập địa chỉ';
              }
              return null;
            },
            onChanged: (value) {
              setState(() {
                isValidAdress = _validateAddress(value);
              });
            },
            controller: addressController,
            focusNode: addressFocusNode,
            nextfocusNode: null,
            labelText: 'Nhập địa chỉ',
            hintText: 'Địa chỉ'),
        const SizedBox(
          height: 30,
        ),
        DefaultButton(
          enabled: isValidFullName && isValidAdress && isValidPhoneNumber,
          text: 'Đăng ký',
          press: () async {
            Accounts accounts = Accounts();
            accounts.email = widget.email;
            accounts.phoneNumber = phonenumberController.text;
            accounts.password = widget.password;
            if (selectedGender != null) {
              accounts.gender = selectedGender;
            } else {
              CustomSnackBar.showCustomSnackBar(
                  context, 'Bạn chưa chọn giới tính', 1,
                  backgroundColor: Colors.red);
              return;
            }

<<<<<<< HEAD
            accounts.imageUrl = await AccountController()
                .uploadImageToFirebaseStorage(
                    '${accounts.email}_${accounts.phoneNumber}', image);

            accounts.username = fullNameController.text;
            accounts.address = addressController.text;
=======
            accounts.imageUrl = await saveImageToNewDirectory(
                image!, 'siuuu', '${accounts.email}_${accounts.phoneNumber}');
            accounts.username = fullNameController.text;

>>>>>>> dd73c3cd0c8237c7ff366b5cd53d449511f67983
            accounts.accounttypeid = 3;
            if (date != null) {
              accounts.birthday = date;
            } else {
              CustomSnackBar.showCustomSnackBar(
                  context, 'vui lòng kiểm tra ngày sinh đã chọn', 1,
                  backgroundColor: Colors.red);
              return;
            }
            print(accounts.toJson());
            await controller.createAccount(accounts.toJson()).whenComplete(() {
              slideinTransition(context, const SignInScreen());
            });
          },
        )
      ]),
    );
  }

  bool _validateFullName(String? fullname) {
    if (fullname == null || fullname.isEmpty) {
      return false;
    }
    return true;
  }

  bool _validatePhoneNumber(String? phonenumber) {
    if (phonenumber == null || phonenumber.isEmpty) {
      return false;
    }
    return true;
  }

  bool _validateAddress(String? address) {
    if (address == null || address.isEmpty) {
      return false;
    }
    return true;
  }
}

// TextFormField buildFullNameField() {
//   return TextFormField(
//     cursorColor: Colors.black,
//     decoration: const InputDecoration(
//       hintText: 'Nhập họ và tên',
//       labelText: 'Họ và tên',
//     ),
//   );
// }

// TextFormField buildBirthDayField() {
//   return TextFormField(
//     cursorColor: Colors.black,
//     decoration: InputDecoration(
//       hintText: 'Nhập ngày sinh',
//       labelText: 'Ngày sinh',
//       helperText: 'Ngày sinh phải có định dạng là ngày/tháng/năm',
//       helperStyle: kHelperTextStyle,
//     ),
//   );
// }

// TextFormField buildPhoneNumberField() {
//   return TextFormField(
//     cursorColor: Colors.black,
//     decoration: const InputDecoration(
//       hintText: 'Nhập số điện thoại',
//       labelText: 'Số điện thoại',
//     ),
//   );
// }

// TextFormField buildAddressField() {
//   return TextFormField(
//     cursorColor: Colors.black,
//     decoration: const InputDecoration(
//       hintText: 'Nhập địa chỉ',
//       labelText: 'Địa chỉ',
//     ),
//   );
// }
