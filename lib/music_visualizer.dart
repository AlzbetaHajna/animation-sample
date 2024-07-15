import 'package:animation_sample/visual_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const _HEIGHT = 100.0;

class MusicVisualizer extends StatefulWidget {
  const MusicVisualizer({super.key});

  @override
  State<MusicVisualizer> createState() => _MusicVisualizerState();
}

class _MusicVisualizerState extends State<MusicVisualizer> {
  bool _stopsAnimation = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FilledButton.icon(
            onPressed: () {
              setState(() {
                _stopsAnimation = !_stopsAnimation;
              });
            },
            icon: Icon(_stopsAnimation ? Icons.play_arrow : Icons.pause),
            label: Text(_stopsAnimation ? 'start' : 'pause'),
          ),
          SizedBox(
            height: _HEIGHT,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: _buildChildren(),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildChildren() {
    final colors = [Colors.teal, Colors.red, Colors.blue, Colors.yellow];
    final durations = [
      Duration(milliseconds: 900),
      Duration(milliseconds: 800),
      Duration(milliseconds: 700),
      Duration(milliseconds: 600),
      Duration(milliseconds: 500),
    ];
    return List<Widget>.generate(
      20,
      (index) => VisualComponent(
        color: colors[index % 4],
        initialHeight: _HEIGHT,
        duration: durations[index % 5],
        stopAnimation: _stopsAnimation,
      ),
    );
  }
}
