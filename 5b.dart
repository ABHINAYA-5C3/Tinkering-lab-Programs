import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => LikeProvider(),
      child: const MyApp(),
    ),
  );
}
/// Provider class
class LikeProvider with ChangeNotifier {
  int globalLikes = 0;
  void addLike() {
    globalLikes++;
    notifyListeners();
  }
  void resetLikes() {
    globalLikes = 0;
    notifyListeners();
  }
}
/// Root widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LikeDemo(),
    );
  }
}
/// Stateful widget (to show setState)
class LikeDemo extends StatefulWidget {
  const LikeDemo({super.key});
  @override
  State<LikeDemo> createState() => _LikeDemoState();
}
class _LikeDemoState extends State<LikeDemo>{
  int localLikes = 0;
  @override
  Widget build(BuildContext context) {
    final likeProvider = Provider.of<LikeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Like System (SetState & Provider)"),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Local Like counter
              Text(
                "Local Likes: $localLikes",
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.thumb_up_alt_outlined),
                onPressed: () {
                  setState(() {
                    localLikes++;
                  });
                },
                label: const Text("Like (setState)"),
              ),
              const SizedBox(height: 30),
              // Global Like counter
              Text(
                "Global Likes: ${likeProvider.globalLikes}",
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.favorite),
                onPressed: likeProvider.addLike,
                label: const Text("Like (Provider)"),
              ),
              const SizedBox(height: 30),
              // Reset Button
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                icon: const Icon(Icons.refresh),
                onPressed: likeProvider.resetLikes,
                label: const Text("Reset Global Likes"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
