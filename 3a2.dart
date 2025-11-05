import 'package:flutter/material.dart';
void main() =>runApp(MaterialApp(home: MyApp()));
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    // Determine view type and background color
    String v = w < 500 ? "Mobile" : w < 800 ? "Tablet" : "Desktop";
    Color bg = w < 500
        ? Colors.lightBlue.shade100
        : w < 800
            ? Colors.orange.shade100
            : Colors.green.shade100;
    return Scaffold(
      body: Container(
        color: bg, // Set background color here
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: Text(
            "$v View\nWidth: ${w.toStringAsFixed(0)} px",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
