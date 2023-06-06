<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:quanlyquantrasua/api/base-url-api.dart';
=======
// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:quanlyquantrasua/api/base-url-api.dart';
import 'package:quanlyquantrasua/controller/account_controller.dart';
>>>>>>> dat

import '../../model/account_model.dart';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

<<<<<<< HEAD
class AccountController extends GetxController {
  Rx<List<Accounts>?> listaccounts = Rx<List<Accounts>?>([]);
  // var account = Accounts().obs;
=======
import '../../model/account_response.dart';

class AccountApi extends GetxController {
  Rx<List<Accounts>?> listaccounts = Rx<List<Accounts>?>([]);
  Rx<AccountResponse?> accountRespone = Rx<AccountResponse?>(null);
  @override
  void onInit() {
    super.onInit();
    fetchCurrent();
  }

  Future<void> fetchCurrent() async {
    accountRespone.value =
        await AccountController().getUserFromSharedPreferences();
  }

>>>>>>> dat
  var lateEmail = ''.obs;
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

<<<<<<< HEAD
  Future<Accounts?> createAccount(
      BuildContext context, Map<String, dynamic> accountToJson) async {
=======
  Future<Accounts?> createAccount(Map<String, dynamic> accountToJson) async {
>>>>>>> dat
    final response = await http.post(
      Uri.parse(ApiUrl.apiCreateAccount),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(accountToJson),
    );

    if (response.statusCode == 200) {
      Accounts accounts = Accounts.fromJson(jsonDecode(response.body));

      return accounts;
    }
    return null;
  }
<<<<<<< HEAD
=======

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
      accountRespone.value =
          await AccountController().getUserFromSharedPreferences();
      return accountResponseResult;
    } else {
      throw Exception('Lỗi: ${response.statusCode}');
    }
  }
>>>>>>> dat
}
