import 'package:flutter/material.dart';
import 'package:movieapp_200559/home.dart';

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        fontFamily: 'Cormorant Garamond',
        scaffoldBackgroundColor: Color.fromARGB(255, 223, 223, 223),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            selectedItemColor: Color.fromRGBO(255, 255, 255, 1))),
    home: Home(),
  ));
}
