import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    // This is the theme of your application.
    //
    // Try running your application with "flutter run". You'll see the
    // application has a blue toolbar. Then, without quitting the app, try
    // changing the primarySwatch below to Colors.green and then invoke
    // "hot reload" (press "r" in the console where you ran "flutter run",
    // or simply save your changes to "hot reload" in a Flutter IDE).
    // Notice that the counter didn't reset back to zero; the application
    // is not restarted.
    primarySwatch: Colors.blue,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.blue,
        shape: CircleBorder(),
        foregroundColor: Colors.white),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.blue,
    ),
  );
}
