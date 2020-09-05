import 'package:flutter/material.dart';
import 'screens/screens.dart';

// test

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weatheroo',
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
