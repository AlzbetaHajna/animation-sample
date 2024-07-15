import 'package:flutter/material.dart';

const _SIZE = 50.0;

class FallingBall extends AnimatedWidget {
  final AnimationController controller;
  FallingBall({super.key, required this.controller}) : super(listenable: controller);

  late final Animation<double> _animation = CurvedAnimation(
    parent: controller,
    curve: Curves.bounceIn,
  );

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0.0, -_animation.value * _SIZE),
      child: _buildContainer(),
    );
  }

  Container _buildContainer() {
    return Container(
      width: _SIZE,
      height: _SIZE,
      decoration: BoxDecoration(
        color: Colors.teal,
        shape: BoxShape.circle,
      ),
    );
  }
}
