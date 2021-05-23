import 'package:boozin/view/home.dart';
import 'package:boozin/view/splash03.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Boozin',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white
        //primarySwatch: Colors.white,
      ),
      home: Splash03(),
    );
  }
}

