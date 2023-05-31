// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:quanlyquantrasua/screens/account_list_screen.dart';

void main() async {
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
