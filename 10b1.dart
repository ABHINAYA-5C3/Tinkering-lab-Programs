import 'package:flutter/material.dart';
void main() =>runApp(const DebugDemoApp());
class DebugDemoApp extends StatelessWidget {
  const DebugDemoApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: true, // Debug banner!
    home: Scaffold(
      appBar: AppBar(title: Text("Flutter Debugging Tools Demo")),
      body: SafeArea(child: BuggyListWidget()),
    ),
  );
}
class BuggyListWidget extends StatelessWidget {
  final items = ['One', 'Two', 'Three'];
  @override
  Widget build(BuildContext context) {
    // Put an assertion to catch bad index bugs
    assert(items.length > 3, 'Not enough items for index 3+!');
    return ListView.builder(
      itemCount: 5, // INTENTIONAL bug: more than available items
      itemBuilder: (ctx, i) {
        // Debug print for every call
        debugPrint("Building item $i");
        // Handle out-of-range with Flutter's error UI
        if (i >= items.length) {
          return ErrorWidget('Index out of range: $i');
        }
        return Card(
          color: Colors.amberAccent,
          child: ListTile(title: Text(items[i])),
        );
      },
    );
  }
}
