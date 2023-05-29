// Future<Accounts> createAccount(AccountsDTO accountDTO) async {
//   final response = await http.post(
//     Uri.parse('https://example.com/createAccount'),
//     headers: {'Content-Type': 'application/json'},
//     body: jsonEncode(accountDTO.toJson()),
//   );
//   if (response.statusCode == 201) {
//     return Accounts.fromJson(jsonDecode(response.body));
//   } else {
//     throw Exception('Failed to create account: ${response.body}');
//   }
// }
// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:quanlyquantrasua/widgets/custom_widgets/messages_widget.dart';

import '../controller/get_ip.dart';
import '../model/account_model.dart';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AccountController extends GetxController {
  Rx<Accounts> accounts = Rx<Accounts>(Accounts());
  Future<List<Accounts>> getAllAccounts() async {
    final ipv4 = await getCurrentIPv4Address();
    try {
      final response = await http
          .get(Uri.parse('http://10.14.112.191:7071/api/accounts/all'));
      if (response.statusCode == 200) {
        //Code lỏd
        // final jsonData = jsonDecode(response.body) as List<dynamic>;
        final jsonData =
            jsonDecode(utf8.decode(response.bodyBytes)) as List<dynamic>;
        return jsonData.map((data) => Accounts.fromJson(data)).toList();
      } else {
        throw Exception('Failed to load accounts: ${response.body}');
      }
    } catch (e) {
      throw Exception('Failed to connect to backend API server: $e');
    }
  }

  Future<Accounts?> createAccount(
      BuildContext context, Map<String, dynamic> accountDTO) async {
    final response = await http.post(
      Uri.parse('http://10.14.112.191:7071/api/accounts/createAccount'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(accountDTO),
    );

    if (response.statusCode == 200) {
      Accounts accounts = Accounts.fromJson(jsonDecode(response.body));

      return accounts;
    }
    return null;
  }
}
