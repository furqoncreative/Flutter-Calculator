import 'dart:async';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  startTime() async {
    var _duration = Duration(seconds: 2);
    return Timer(_duration, () {
      Navigator.of(context).pushReplacementNamed('/calculator');
    });
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Image.asset(
            'assets/calculator.png',
            width: 100,
            height: 100,
          ),
        ),
      ),
    );
  }
}
