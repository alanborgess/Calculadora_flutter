import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _output = "0";

  void _buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        _output = "";
      } else if (buttonText == "=") {
        _output = eval(_output);
      } else {
        if (_output == "0") {
          _output = buttonText;
        } else {
          _output += buttonText;
        }
      }
    });
  }

 String eval(String expression) {
  Parser p = Parser();
  Expression exp = p.parse(expression);
  ContextModel cm = ContextModel();
  double eval = exp.evaluate(EvaluationType.REAL, cm);
  return eval.toString();
}


  Widget buildButton(String buttonText, Color buttonColor, {int flex = 1}) {
    return Expanded(
      flex: flex,
      child: Container(
        margin: EdgeInsets.all(2),
        child: ElevatedButton(
          onPressed: () => _buttonPressed(buttonText),
          child: Text(
            buttonText,
            style: TextStyle(fontSize: 28
            ),
          ),
            style: ElevatedButton.styleFrom(
              minimumSize: Size(200, 85),
              backgroundColor: buttonColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
           ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora",
         style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          fontFamily: "Roboto",
          ),
        ),
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0),
                border: Border.all(
                  width: 8,
                  color: Color.fromARGB(255, 75, 139, 26),
                ),
              ),
              child: Container(
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
                child: Text(
                  _output,
                  style: TextStyle(fontSize: 58),
                ),
              ),
          ),
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            children: <Widget>[
              buildButton("7", Colors.black),
              buildButton("8", Colors.black),
              buildButton("9", Colors.black),
              buildButton("/", Colors.orange),
            ],
          ),
          Row(
            children: <Widget>[
              buildButton("4", Colors.black),
              buildButton("5", Colors.black),
              buildButton("6", Colors.black),
              buildButton("*", Colors.orange),
            ],
          ),
          Row(
            children: <Widget>[
              buildButton("1", Colors.black),
              buildButton("2", Colors.black),
              buildButton("3", Colors.black),
              buildButton("-", Colors.orange),
            ],
          ),
          Row(
            children: <Widget>[
              buildButton("C", Colors.red),
              buildButton("0", Colors.black),
              buildButton(".", Colors.black),
              buildButton("+", Colors.orange),
            ],
          ),
          Row(
            children: <Widget>[
              buildButton("=", Colors.green, flex: 2),
            ],
          ),
        ],
      ),
    );
  }
}
