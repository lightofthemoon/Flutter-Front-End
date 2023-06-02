// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:quanlyquantrasua/screens/home/home_screens.dart';

void main() async {
  runApp(
    MaterialApp(
      initialRoute: 'introduction_screen',
      debugShowCheckedModeBanner: false,
      routes: {
        'introduction_screen': (context) => HomeScreenView(),
        'list_accounts': (context) => Account(),
      },
    ),
  );
}
