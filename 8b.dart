import 'package:flutter/material.dart';
void main() =>runApp(MaterialApp(home: AnimationExperiment()));
class AnimationExperiment extends StatefulWidget {
  @override
  State<AnimationExperiment> createState() => _AnimationExperimentState();
}
class _AnimationExperimentState extends State<AnimationExperiment>{
  bool _show = true;
  Offset _offset = Offset(0, 0);
  double _scale = 1.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animations Experiment')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              duration: Duration(seconds: 1),
              opacity: _show ? 1.0 : 0.1,
              child: AnimatedSlide(
                duration: Duration(seconds: 1),
                offset: _offset,
                child: AnimatedScale(
                  duration: Duration(seconds: 1),
                  scale: _scale,
                  child: Icon(
                    Icons.star,
                    size: 120,
                    color: Colors.amber,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Wrap(
              spacing: 10,
              children: [
                ElevatedButton(
                  onPressed: () => setState(() => _show = !_show),
                  child: Text(_show ? 'Fade Out' : 'Fade In'),
                ),
                ElevatedButton(
                  onPressed: () => setState(() => 
                    _offset = _offset == Offset(2,0) ? Offset(0,0) : Offset(2,0)
                  ),
                  child: Text('Slide'),
                ),
                ElevatedButton(
                  onPressed: () => setState(() => 
                    _scale = _scale == 1.0 ? 1.5 : 1.0
                  ),
                  child: Text('Scale'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
