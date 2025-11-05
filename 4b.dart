import 'package:flutter/material.dart';
void main() {
  runApp(MaterialApp(
    routes: {
      '/': (context) => HomePage(),
      '/profile': (context) => ProfilePage(),
    },
  ));
}
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Hey Abhi, Welcome!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Open Profile'),
              onPressed: () {
                Navigator.pushNamed(context, '/profile');
              },
            ),
          ],
        ),
      ),
    );
  }
}
class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text('Return Home'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
