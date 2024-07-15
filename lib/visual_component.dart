import 'package:flutter/material.dart';

const _WIDTH = 10.0;

class VisualComponent extends StatefulWidget {
  final Color color;
  final double initialHeight;
  final Duration duration;
  final bool stopAnimation;
  const VisualComponent({
    super.key,
    required this.color,
    required this.initialHeight,
    required this.duration,
    required this.stopAnimation,
  });

  @override
  State<VisualComponent> createState() => _VisualComponentState();
}

class _VisualComponentState extends State<VisualComponent> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: widget.duration,
    vsync: this,
  );

  late final Animation<double> _easeInOutAnimation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeInOutCubic,
  );

  @override
  Widget build(BuildContext context) {
    if (widget.stopAnimation) {
      _controller.stop();
    } else {
      _controller.repeat(reverse: true);
    }
    return AnimatedBuilder(
      animation: _easeInOutAnimation,
      builder: (context, child) {
        return Container(
          width: _WIDTH,
          height: widget.initialHeight * _easeInOutAnimation.value,
          decoration: BoxDecoration(
            color: widget.color,
            borderRadius: BorderRadius.circular(5.0),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
