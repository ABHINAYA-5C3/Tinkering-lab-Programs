import 'package:flutter/material.dart';
void main() =>runApp(const DebugDemoApp());
class DebugDemoApp extends StatelessWidget {
  const DebugDemoApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: true,
    home: Scaffold(
      appBar: AppBar(title: Text("Flutter Debugging Tools Demo")),
      body: SafeArea(child: FixedListWidget()),
    ),
  );
}
class FixedListWidget extends StatelessWidget {
  final items = ['One', 'Two', 'Three'];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length, // FIXED! Only show available items
      itemBuilder: (ctx, i) {
        return Card(
          color: Colors.amberAccent,
          child: ListTile(title: Text(items[i])),
        );
      },
    );
  }
