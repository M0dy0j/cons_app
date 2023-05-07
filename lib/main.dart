import 'package:cons_app/views/auth.dart';
import 'package:cons_app/views/home.dart';
import 'package:cons_app/views/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
          backgroundColor: Colors.grey.shade200,
          body: AuthScreen()
      ),
    );
  }
}
