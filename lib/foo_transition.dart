import 'package:flutter/material.dart';

const _WIDTH = 300.0;
const _HEIGHT = 50.0;

class FooTransition extends AnimatedWidget {
  final AnimationController controller;
  FooTransition({super.key, required this.controller}) : super(listenable: controller);

  late final Animation<double> _animation = CurvedAnimation(
    parent: controller,
    curve: Curves.linearToEaseOut,
  );

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.identity()
        ..rotateX(_animation.value)
        ..rotateY(_animation.value),
      child: _buildContainer(),
    );
  }

  Container _buildContainer() {
    return Container(
      width: _WIDTH,
      height: _WIDTH,
      decoration: BoxDecoration(
        color: _color,
      ),
    );
  }

  Color? get _color => Color.lerp(Colors.red, Colors.white, controller.value);
}
