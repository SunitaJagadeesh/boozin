import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:boozin/view/splash02.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';


class Splash03 extends StatefulWidget {
  @override
  _Splash03State createState() => _Splash03State();
}

class _Splash03State extends State<Splash03> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      curve: Curves.easeInCirc,
      //duration: 2500,
      splash: 'assets/boozin_logo_03.png',
      nextScreen: Splash02(),
      splashTransition: SplashTransition.sizeTransition
    );
  }
}
