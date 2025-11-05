import 'package:flutter/material.dart';
class MyButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const MyButton({required this.text, required this.onPressed, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => ElevatedButton(
    style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
    onPressed: onPressed,
    child: Text(text, style: TextStyle(color: Colors.white)),
  );
}
