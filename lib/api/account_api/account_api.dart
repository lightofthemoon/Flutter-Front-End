// ignore_for_file: avoid_print, use_build_context_synchronously

<<<<<<< HEAD
import 'package:quanlyquantrasua/api/base_url_api.dart';
import 'package:quanlyquantrasua/controller/account_controller.dart';

=======
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:quanlyquantrasua/api/base-url-api.dart';
import 'package:quanlyquantrasua/widgets/custom_widgets/messages_widget.dart';
import 'package:image/image.dart' as img;
>>>>>>> dd73c3cd0c8237c7ff366b5cd53d449511f67983
import '../../model/account_model.dart';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../model/account_response.dart';

<<<<<<< HEAD
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

=======
class AccountController extends GetxController {
  Rx<List<Accounts>?> listaccounts = Rx<List<Accounts>?>([]);
  Rx<AccountResponse?> accountRespone = Rx<AccountResponse?>(null);
>>>>>>> dd73c3cd0c8237c7ff366b5cd53d449511f67983
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

  Future<Accounts?> createAccount(Map<String, dynamic> accountToJson) async {
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
<<<<<<< HEAD
      await AccountController()
          .storedUserToSharedRefererces(accountResponseResult);
=======
>>>>>>> dd73c3cd0c8237c7ff366b5cd53d449511f67983
      return accountResponseResult;
    } else {
      throw Exception('Lỗi: ${response.statusCode}');
    }
  }
<<<<<<< HEAD

  Future<void> logout() async {
    await AccountController().logout();
    accountRespone.value = null;
  }
=======
>>>>>>> dd73c3cd0c8237c7ff366b5cd53d449511f67983
}
