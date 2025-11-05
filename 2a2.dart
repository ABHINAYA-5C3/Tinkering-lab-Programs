import 'package:flutter/material.dart';
void main() =>runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar( title: Text("Image"), // AppBar title ),
        body: Center( child: Image.network(
            'https://upload.wikimedia.org/wikipedia/commons/e/e1/FullMoon2010.jpg',
            width: 150,
          ),
        ),
      ),
    );
  }
}
