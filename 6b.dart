import 'package:flutter/material.dart';
void main() =>runApp(const MyApp());
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.teal,
        cardColor: Colors.teal.shade50,
        textTheme: const TextTheme(
          headlineSmall: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.teal,
          ),
          bodyMedium: TextStyle(
            fontSize: 18,
            color: Colors.black87,
          ),
        ),
      ),
      home: const GreetingCardScreen(),
    );
  }
}
class GreetingCardScreen extends StatelessWidget {
  const GreetingCardScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(title: const Text('Themed Greeting Card')),
      body: Center(
        child: Card(
          color: Theme.of(context).cardColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 6,
          margin: const EdgeInsets.all(20),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Text("Hello, Flutter!",
                  style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: 10),
              Text("Welcome to the world of custom themes 🌿",
                  style: Theme.of(context).textTheme.bodyMedium),
            ]),
          ),
        ),
      ),
    );
  }
}
