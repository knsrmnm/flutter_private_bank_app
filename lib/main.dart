import 'package:flutter/material.dart';
import 'package:flutter_private_bank_app/screen/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Private Bank',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
