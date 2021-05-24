import 'package:boozin/view/home.dart';
import 'package:boozin/view/splash03.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'dark_mode/dark_theme_provider.dart';
import 'dark_mode/styles.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  DarkThemeProvider themeChangeProvider = new DarkThemeProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
    await themeChangeProvider.darkThemePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return
      ChangeNotifierProvider(
        create: (_) {
          return themeChangeProvider;
        },
        child: Consumer<DarkThemeProvider>(
          builder: (BuildContext context, value, Widget child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: Styles.themeData(themeChangeProvider.darkTheme, context),
              home: Splash03(),
            );
          },
        ),);
  }
}

/*
debugShowCheckedModeBanner: false,
        title: 'Boozin',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white
          //primarySwatch: Colors.white,
        ),
        home: Splash03(),
 */
