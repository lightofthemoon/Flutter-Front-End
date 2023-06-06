// ignore_for_file: prefer_const_constructors

<<<<<<< HEAD
import 'package:flutter/material.dart';
=======
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quanlyquantrasua/screens/account_list_screen.dart';
>>>>>>> dat

import 'package:quanlyquantrasua/screens/home/home_screens.dart';

void main() async {
<<<<<<< HEAD
  runApp(
    MaterialApp(
      initialRoute: 'introduction_screen',
      debugShowCheckedModeBanner: false,
      routes: {
        'introduction_screen': (context) => HomeScreenView(),
=======
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseAuth.instance.signInAnonymously();
  runApp(
    MaterialApp(
      initialRoute: 'home_screen',
      debugShowCheckedModeBanner: false,
      routes: {
        'account_list': (context) => AccountsListScreen(),
        'home_screen': (context) => HomeScreenView(),
>>>>>>> dat
      },
    ),
  );
}
