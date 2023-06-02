// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quanlyquantrasua/screens/account_list_screen.dart';

import 'package:quanlyquantrasua/screens/home/home_screens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      initialRoute: 'account_list',
      debugShowCheckedModeBanner: false,
      routes: {
        'account_list': (context) => AccountsListScreen(),
        'introduction_screen': (context) => HomeScreenView(),
      },
    ),
  );
}
