import 'package:bitmap/constants.dart';
import 'package:bitmap/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue, backgroundColor: kPrimaryBackgroundColor),
      home: const LoginPage(),
    );
  }
}
