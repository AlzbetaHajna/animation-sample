import 'package:flutter/material.dart';

const _WIDTH = 300.0;
const _HEIGHT = 50.0;

class CustomProgressBar extends AnimatedWidget {
  final AnimationController controller;
  CustomProgressBar({super.key, required this.controller}) : super(listenable: controller);

  late final Animation<double> _animation = CurvedAnimation(
    parent: controller,
    curve: Curves.linear,
  );

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(-_animation.value * _WIDTH, 0.0),
      child: _buildContainer(),
    );
  }

  Container _buildContainer() {
    return Container(
      width: _WIDTH,
      height: _HEIGHT,
      decoration: BoxDecoration(
        color: _color,
      ),
    );
  }

  Color? get _color => Color.lerp(Colors.red, Colors.red[200], controller.value);
}
