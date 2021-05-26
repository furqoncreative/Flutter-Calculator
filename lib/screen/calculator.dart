import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:submission_flutter/screen/about.dart';

class Calculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SimpleCalculator(),
    );
  }
}

class SimpleCalculator extends StatefulWidget {
  @override
  _SimpleCalculatorState createState() => _SimpleCalculatorState();
}

class _SimpleCalculatorState extends State<SimpleCalculator> {
  String equation = "0";
  String result = "0";
  String expression = "";
  double equationFontSize = 38.0;
  double resultFontSize = 48.0;

  Widget buttonBuilder(
      String buttonText, double buttonHeight, Color textColor) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1 * buttonHeight,
      padding: const EdgeInsets.all(10),
      color: Colors.white,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.white,
            shadowColor: Colors.grey,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16.0))),
            padding: EdgeInsets.all(16.0),
          ),
          onPressed: () => buttonPressedHandler(buttonText),
          child: Text(
            buttonText,
            style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.normal,
                color: textColor),
          )),
    );
  }

  buttonPressedHandler(String buttonText) {
    setState(() {
      switch (buttonText) {
        case "C":
          {
            equation = "0";
            result = "0";
            equationFontSize = 38.0;
            resultFontSize = 48.0;
          }
          break;
        case "⌫":
          {
            equationFontSize = 48.0;
            resultFontSize = 38.0;
            equation = equation.substring(0, equation.length - 1);
            if (equation == "") {
              equation = "0";
            }
          }
          break;
        case "=":
          {
            equationFontSize = 38.0;
            resultFontSize = 48.0;

            expression = equation;
            expression = expression.replaceAll('×', '*');
            expression = expression.replaceAll('÷', '/');

            try {
              Parser p = Parser();
              Expression exp = p.parse(expression);

              ContextModel cm = ContextModel();
              result = '${exp.evaluate(EvaluationType.REAL, cm)}';
            } catch (e) {
              result = "Error";
            }
          }
          break;
        default:
          {
            equationFontSize = 48.0;
            resultFontSize = 38.0;
            if (equation == "0") {
              equation = buttonText;
            } else {
              equation = equation + buttonText;
            }
          }
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Calculator',
            style: TextStyle(color: Colors.blueGrey),
          ),
          backgroundColor: Colors.white,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.info, color: Colors.blueGrey),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutPage()),
                );
              },
            )
          ]),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(
              equation,
              style: TextStyle(fontSize: equationFontSize),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
            child: Text(
              result,
              style: TextStyle(fontSize: resultFontSize),
            ),
          ),
          Expanded(
            child: Divider(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * .75,
                child: Table(
                  children: [
                    TableRow(children: [
                      buttonBuilder("C", 1, Colors.redAccent),
                      buttonBuilder("⌫", 1, Colors.redAccent),
                      buttonBuilder("÷", 1, Colors.lightBlue),
                    ]),
                    TableRow(children: [
                      buttonBuilder("7", 1, Colors.blueGrey),
                      buttonBuilder("8", 1, Colors.blueGrey),
                      buttonBuilder("9", 1, Colors.blueGrey),
                    ]),
                    TableRow(children: [
                      buttonBuilder("4", 1, Colors.blueGrey),
                      buttonBuilder("5", 1, Colors.blueGrey),
                      buttonBuilder("6", 1, Colors.blueGrey),
                    ]),
                    TableRow(children: [
                      buttonBuilder("1", 1, Colors.blueGrey),
                      buttonBuilder("2", 1, Colors.blueGrey),
                      buttonBuilder("3", 1, Colors.blueGrey),
                    ]),
                    TableRow(children: [
                      buttonBuilder(".", 1, Colors.blueGrey),
                      buttonBuilder("0", 1, Colors.blueGrey),
                      buttonBuilder("00", 1, Colors.blueGrey),
                    ]),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.25,
                child: Table(
                  children: [
                    TableRow(children: [
                      buttonBuilder("×", 1, Colors.lightBlue),
                    ]),
                    TableRow(children: [
                      buttonBuilder("-", 1, Colors.lightBlue),
                    ]),
                    TableRow(children: [
                      buttonBuilder("+", 1, Colors.lightBlue),
                    ]),
                    TableRow(children: [
                      buttonBuilder("=", 2, Colors.lightBlue),
                    ]),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
