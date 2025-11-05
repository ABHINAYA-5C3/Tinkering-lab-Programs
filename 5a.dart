import 'package:flutter/material.dart';
void main() {
  runApp(MaterialApp(home: MyPage()));
}
class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Stateless & Stateful Widgets')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Stateless Widget', style: TextStyle(fontSize: 20)),
            Text('I never change! 😊'),
            SizedBox(height: 30),
            Text('Stateful Widget', style: TextStyle(fontSize: 20)),
            CounterWidget(),
          ],
        ),
      ),
    );
  }
}
class CounterWidget extends StatefulWidget {
  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}
class _CounterWidgetState extends State<CounterWidget>{
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Count: $count'),
        ElevatedButton(
          onPressed: () {
            setState(() {
              count++;
            });
          },
          child: Text('Increase'),
        ),
      ],
    );
  }
}
