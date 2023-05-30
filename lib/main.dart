// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:quanlyquantrasua/screens/home/home_screens.dart';

import 'controller/get_ip.dart';

void main() async {
  final ipv4 = await getCurrentIPv4Address();

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
