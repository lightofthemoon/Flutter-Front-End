import 'package:flutter/material.dart';
import 'package:quanlyquantrasua/api/base-url-api.dart';

import '../../model/account_model.dart';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class FetchApiController extends GetxController {
  Future<List<Accounts>> getAllAccounts() async {
    try {
      final response = await http.get(Uri.parse(ApiUrl.apiCreateCategory));
      if (response.statusCode == 200) {
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
