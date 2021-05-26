import 'package:submission_flutter/screen/calculator.dart';
import 'package:submission_flutter/screen/splash.dart';
import 'package:submission_flutter/screen/about.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashPage(),
      routes: {'/calculator': (BuildContext context) => Calculator()},
    );
  }
}
