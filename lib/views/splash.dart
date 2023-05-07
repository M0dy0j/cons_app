import 'dart:async';
import 'package:cons_app/views/auth.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const AuthScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color:  const Color(0xff3A98B9),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('images/logo.png',width: 160,),
            const SizedBox(height: 18,),
            Text(
              'ديوان رئيس الوزراء',
              style: TextStyle(
                color: Colors.grey.shade200,
                fontWeight: FontWeight.w800,
                fontSize: 26,
                letterSpacing: 3,
              ),
            ),
          ],
        ),
      )
    );
  }
}
