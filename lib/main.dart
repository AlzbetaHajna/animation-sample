import 'package:animation_sample/falling_ball.dart';
import 'package:animation_sample/foo_transition.dart';
import 'package:animation_sample/music_visualizer.dart';
import 'package:animation_sample/progress_bar.dart';
import 'package:animation_sample/visual_component.dart';
import 'package:flutter/material.dart';

/// Flutter code sample for [RotationTransition].

void main() => runApp(const FooTransitionExampleApp());

class FooTransitionExampleApp extends StatelessWidget {
  const FooTransitionExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // home: Scaffold(body: FooTransitionExample()),
      home: Scaffold(body: MusicVisualizer()),
    );
  }
}

class FooTransitionExample extends StatefulWidget {
  const FooTransitionExample({super.key});

  @override
  State<FooTransitionExample> createState() => _FooTransitionExampleState();
}

/// [AnimationController]s can be created with `vsync: this` because of
/// [TickerProviderStateMixin].
class _FooTransitionExampleState extends State<FooTransitionExample> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomProgressBar(controller: _controller),
        FooTransition(controller: _controller),
        FallingBall(controller: _controller),
      ],
    );
  }
}
