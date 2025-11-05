import 'package:flutter/material.dart';
void main() =>runApp(const MaterialApp(home: IconCardExample()));
class IconCardExample extends StatelessWidget {
  const IconCardExample({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: IconCard(icon: Icons.favorite, text: "Love", color: Colors.pink),
      ),
    );
  }
}
// 💖 Custom Widget
class IconCard extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  const IconCard({super.key, required this.icon, required this.text, required this.color});
  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: color.withOpacity(0.2),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Icon(icon, color: color, size: 40),
          const SizedBox(height: 8),
          Text(text, style: TextStyle(color: color, fontSize: 18))
        ]),
      );
}
