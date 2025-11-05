import 'package:flutter/material.dart';
void main() =>runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold( appBar: AppBar(title: Text("Container"), // AppBar title ),
        body: Center(
          child: Container(
            width: 150,
            height: 100,
            color: Colors.amber,
            child: Center(
              child: Text("Hello"),
            ),
          ),
        ),
      ),
    );
  }
}
