import 'package:adv_exam/Screens/detailPage.dart';
import 'package:adv_exam/Screens/homePage.dart';
import 'package:adv_exam/Screens/splashScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => Splashscreen(),
        'homepage': (context) => Homepage(),
        'detailPage': (context) => DetailPage(),
      },
    ),
  );
}
