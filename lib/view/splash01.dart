import 'package:boozin/view/home.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class Splash01 extends StatefulWidget {
  @override
  _Splash01State createState() => _Splash01State();
}

class _Splash01State extends State<Splash01> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 5,
      navigateAfterSeconds: Home(),
      image: Image.asset('assets/boozin_logo_01.png'),
      title: Text('Fitness'),
      loaderColor: Colors.white,

    );
  }
}
