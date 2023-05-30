// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quanlyquantrasua/api/user/create_accounts.dart';
import 'package:quanlyquantrasua/screens/account_list_screen.dart';

import 'controller/get_ip.dart';

void main() async {
  final ipv4 = await getCurrentIPv4Address();

  runApp(
    MaterialApp(
      initialRoute: 'introduction_screen',
      debugShowCheckedModeBanner: false,
      routes: {
        'introduction_screen': (context) => AccountsListScreen(),
      },
    ),
  );
}
