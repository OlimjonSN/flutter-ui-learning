// ignore_for_file: deprecated_member_use, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.white,
          scaffoldBackgroundColor: Colors.black,
          backgroundColor: Colors.black,
          accentColor: Colors.white38,
          // ignore: prefer_const_constructors
          textTheme: TextTheme(
              // ignore: prefer_const_constructors
              headline1: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontSize: 43))),

      // ignore: prefer_const_constructors
      home: HomeScreen(),
    );
  }
}
