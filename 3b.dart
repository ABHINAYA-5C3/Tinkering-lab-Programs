import 'package:flutter/material.dart';
void main() =>runApp(const MyApp());
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Responsive Star Boxes')),
        body: LayoutBuilder(
          builder: (context, c) {
            double w = c.maxWidth;
            int columns = w < 600 ? 1 : w < 1000 ? 2 : 4;
            int stars = w < 600 ? 1 : w < 1000 ? 3 : 5;
            Color bg = w < 600 ? Colors.lightBlue.shade100 : w < 1000 ? Colors.orange.shade100 : Colors.green.shade100;
            List<String> names = ['yk', 'abhi', 'santhu', 'manju'];
            return Container(
              color: bg,
              padding: const EdgeInsets.all(16),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: columns,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 2,
                ),
                itemCount: names.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: List.generate(
                            stars,
                            (_) => const Icon(Icons.star, color: Colors.yellow),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(names[index], style: const TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
