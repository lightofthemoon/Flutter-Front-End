import 'package:flutter/material.dart';
import 'package:quanlyquantrasua/api/base-url-api.dart';

import '../../model/account_model.dart';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AccountController extends GetxController {
  Rx<List<Accounts>?> listaccounts = Rx<List<Accounts>?>([]);
  // var account = Accounts().obs;
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

  Future<Accounts?> createAccount(
      BuildContext context, Map<String, dynamic> accountToJson) async {
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
}
