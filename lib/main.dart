// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
<<<<<<< HEAD

import 'package:quanlyquantrasua/screens/account_list_screen.dart';
=======
import 'package:quanlyquantrasua/screens/home/home_screens.dart';
>>>>>>> tinh

void main() async {
  runApp(
    MaterialApp(
      initialRoute: 'introduction_screen',
      debugShowCheckedModeBanner: false,
      routes: {
        'introduction_screen': (context) => HomeScreenView(),
      },
    ),
  );
}
