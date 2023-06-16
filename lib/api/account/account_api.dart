// ignore_for_file: avoid_print, use_build_context_synchronously
import 'package:intl/intl.dart';
import 'package:quanlyquantrasua/controller/account_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/account_model.dart';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../model/account_response.dart';
import '../base_url_api.dart';

class AccountApi extends GetxController {
  Rx<List<Accounts>?> listaccounts = Rx<List<Accounts>?>([]);
  Rx<AccountResponse?> accountRespone = Rx<AccountResponse?>(null);
  @override
  void onInit() {
    super.onInit();
    fetchCurrent();
  }

  Future fetchCurrent() async {
    accountRespone.value =
        await AccountController().getUserFromSharedPreferences();
  }

  Future getAllAccounts() async {
    try {
      final response = await http.get(Uri.parse(ApiUrl.apiGetAllAccount));
      final jsonData =
          jsonDecode(utf8.decode(response.bodyBytes)) as List<dynamic>;
      listaccounts.value =
          jsonData.map((data) => Accounts.fromJson(data)).toList();

      if (response.statusCode != 200) {
        throw Exception('Load Account thất bại: ${response.body}');
      }
    } catch (e) {
      throw Exception('Không thể kết nối đến server: $e');
    }
  }

  Future<Accounts?> createAccount(Accounts account) async {
    final response = await http.post(
      Uri.parse(ApiUrl.apiCreateAccount),
      body: {
        "password": account.password!,
        "fullName": account.username!,
        "phoneNumber": account.phoneNumber!,
        "email": account.email!,
        "gender": account.gender!,
        "birthday": DateFormat('yyyy-MM-dd').format(account.birthday!),
        "address": account.address!,
        "accountTypeId": account.accounttypeid!.toString(),
        "imageUrl": account.imageUrl!
      },
    );

    if (response.statusCode == 200) {
      Accounts accounts = Accounts.fromJson(jsonDecode(response.body));

      return accounts;
    }
    return null;
  }

  Future<AccountResponse> login(Map<String, dynamic> accountToJson) async {
    final url = Uri.parse(ApiUrl.apiLogin);
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(accountToJson),
    );
    if (response.statusCode == 200) {
      final accountResponseResult =
          AccountResponse.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
      accountRespone.value = accountResponseResult;
      await AccountController()
          .storedUserToSharedRefererces(accountResponseResult);
      return accountResponseResult;
    } else {
      throw Exception('Lỗi: ${response.statusCode}');
    }
  }

  Future<String> sendOtpToEmail(String email) async {
    final url = Uri.parse('${ApiUrl.apiSendOTP}?email=$email');
    var response = await http.post(url);
    if (response.statusCode == 200) {
      print(response.body);
      return 'Đã gửi mã xác nhận\nVui lòng kiểm tra hộp thư của bạn!';
    } else if (response.statusCode == 400) {
      print(response.body);
      return 'Không tìm thấy tài khoản!';
    } else {
      print(response.body);
      return 'Không thể gửi mã xác nhận do lỗi:${response.statusCode}!';
    }
  }

  Future<String> changePassword(
      String email, String otp, String newpassword) async {
    final url = Uri.parse('${ApiUrl.apiChangePassword}/$email');
    final response = await http.put(url, body: {
      'otpValue': otp,
      'newPassword': newpassword,
    });
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return response.body;
    }
  }

  Future logout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('currrent_account');
    accountRespone.value = null;
  }
}
