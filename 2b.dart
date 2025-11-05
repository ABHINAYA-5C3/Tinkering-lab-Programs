import 'package:flutter/material.dart';
void main() =>runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar( title: Text("Row, Column, Stack"),),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
 // Row Example
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.star, color: Colors.red),
                  Icon(Icons.star, color: Colors.green),
                  Icon(Icons.star, color: Colors.blue),
                ],
              ),
              SizedBox(height: 20),
                // Column Example
              Column(
                children: [
                  Text("abhi"),
                  Text("yk"),
                  Text("santhu")
                ],
            ),
           SizedBox(height: 20),
            // Stack Example
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    color: Colors.amber,
                  ),
                  Text(
                    "Stacked Text",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
