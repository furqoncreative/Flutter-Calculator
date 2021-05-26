import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: Text(
              'About',
              style: TextStyle(color: Colors.blueGrey),
            ),
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.blueGrey),
              onPressed: () {
                Navigator.pop(context);
              },
            )),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/calculator.png',
                width: 100,
                height: 100,
              ),
              Text(
                'Calculator App',
                style: TextStyle(
                    fontFamily: 'Pacifico',
                    color: Colors.blueGrey,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
                width: 150,
                child: Divider(
                  color: Color(0xfff07b3f),
                ),
              ),
              Text(
                'About Developer',
                style: TextStyle(
                    fontFamily: 'Pacifico',
                    color: Colors.blueGrey,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 2, horizontal: 25),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/furqon.png'),
                  ),
                  title: Text('Deden Muhammad Furqon'),
                  subtitle: Text(
                      'github : github.com/furqoncreative \nwebsite : furqoncreative.github.io\ninstagram : instagram.com/furqoncreative'),
                  isThreeLine: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
