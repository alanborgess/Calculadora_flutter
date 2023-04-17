import 'package:flutter/material.dart';
import 'homepage.dart';


void main() => runApp(CalculatorApp());

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora',
      home: Calculator(),
      debugShowCheckedModeBanner: false,
    );
  }
}
