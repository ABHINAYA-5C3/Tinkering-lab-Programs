import 'dart:math';
import 'package:flutter/material.dart';
void main() =>runApp(MaterialApp(home: AnimatedScreen()));
class AnimatedScreen extends StatefulWidget {
  @override
  _AnimatedScreenState createState() => _AnimatedScreenState();
}
class _AnimatedScreenState extends State<AnimatedScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController c;
  @override
  void initState() {
    super.initState();
    c = AnimationController(vsync: this, duration: const Duration(seconds: 8))
      ..repeat();
  }
  @override
  Widget build(BuildContext context) => Scaffold(
        body: AnimatedBuilder(
          animation: c,
          builder: (_, __) => CustomPaint(
            painter: CirclePainter(c.value),
            child: Container(),
          ),
        ),
      );
  @override
  void dispose() => c.dispose();
}
class CirclePainter extends CustomPainter {
  final double t;
  CirclePainter(this.t);
  @override
  void paint(Canvas canvas, Size s) {
    final p = Paint()..style = PaintingStyle.fill;
    final rnd = Random(42);
    for (int i = 0; i < 10; i++) {
      p.color = HSVColor.fromAHSV(1, (i * 40 + t * 360) % 360, 1, 1)
          .toColor()
          .withOpacity(0.4);
      final r = 60 + 80 * sin(t * 2 * pi + i);
      canvas.drawCircle(
          Offset(s.width * rnd.nextDouble(), s.height * rnd.nextDouble()), r, p);
    }
  }
  @override
  bool shouldRepaint(CirclePainter o) => true;
}
