import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CyberLearn',
      theme: ThemeData(
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
          titleTextStyle: TextStyle(
            fontFamily: 'Digital',
            fontSize: 24.0,
          ),
        ),
        textTheme: TextTheme(
          headline6: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
          bodyText1: TextStyle(color: Colors.white),
        ),
      ),
      home: const HomePage(title: 'Diverse News'),
    );
  }
}