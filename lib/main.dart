import 'package:axa_casper_app/Theme/theme.dart';
import 'package:axa_casper_app/pages/home/home_page.dart';
import 'package:axa_casper_app/pages/home/home_page_loader.dart';
import 'package:axa_casper_app/pages/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Axper',
      theme: ThemeData(
        primaryColor: ThemeAxper.primaryBlue,
        buttonTheme: ButtonThemeData(
          buttonColor: ThemeAxper.primaryBlue,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
        ),
        appBarTheme: const AppBarTheme(
          color: ThemeAxper.primaryBlue,
        ),
      ),
      home: const HomePageLoader(index: 0),
    );
  }
}
