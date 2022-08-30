

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'ui/home/homePage.dart';

import 'util/controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(

          primarySwatch: Colors.blue,
          fontFamily: "Lato",
          unselectedWidgetColor: const Color(0xFF0E3C6E),
          radioTheme: RadioThemeData(
            fillColor: MaterialStateColor.resolveWith(
                (states) => const Color(0xFF0E3C6E)),
          ),
      textTheme: const TextTheme(caption: TextStyle(
        color: Color(0xFF8E8E8E),
        fontWeight: FontWeight.w600,
        fontSize: 9,
      ),subtitle1: TextStyle(
        color: Color(0xFF8E8E8E),
        fontWeight: FontWeight.w600,
        fontSize: 9,
      ),
      headline2: TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: 20,
          color: Colors.white),
      headline4: TextStyle(
          color: Colors.black, fontWeight: FontWeight.w700, fontSize: 16),
      bodyText1: TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w700),
      labelMedium: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 18,
          color: Colors.black),
      bodyText2: TextStyle(
        color: Color(0xFF8E8E8E),
        fontWeight: FontWeight.w600,
        fontSize: 12,
      ),)),
      home: const MyHomePage(),
      initialBinding: JsonBinding(),
    );
  }
}




