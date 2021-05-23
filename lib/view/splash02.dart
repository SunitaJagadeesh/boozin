import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:boozin/view/home.dart';
import 'package:boozin/view/splash01.dart';
import 'package:boozin/view/splash03.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class Splash02 extends StatefulWidget {
  @override
  _Splash02State createState() => _Splash02State();
}

class _Splash02State extends State<Splash02> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: 'assets/boozin_logo_02.png',
        nextScreen: Home(),
        splashTransition: SplashTransition.fadeTransition
    );
  }
}
