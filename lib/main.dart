// ignore_for_file: prefer_const_constructors

<<<<<<< HEAD
import 'package:firebase_auth/firebase_auth.dart';
=======
>>>>>>> dd73c3cd0c8237c7ff366b5cd53d449511f67983
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quanlyquantrasua/screens/account_list_screen.dart';

import 'package:quanlyquantrasua/screens/home/home_screens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
<<<<<<< HEAD
  await FirebaseAuth.instance.signInAnonymously();
  runApp(
    MaterialApp(
      initialRoute: 'home_screen',
      debugShowCheckedModeBanner: false,
      routes: {
        'account_list': (context) => AccountsListScreen(),
        'home_screen': (context) => HomeScreenView(),
=======
  runApp(
    MaterialApp(
      initialRoute: 'account_list',
      debugShowCheckedModeBanner: false,
      routes: {
        'account_list': (context) => AccountsListScreen(),
        'introduction_screen': (context) => HomeScreenView(),
>>>>>>> dd73c3cd0c8237c7ff366b5cd53d449511f67983
      },
    ),
  );
}
