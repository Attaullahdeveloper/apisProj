import 'package:flutter/material.dart';

class SimpleIconAnimation extends StatefulWidget {
  final Color iconColor;

  const SimpleIconAnimation({super.key, this.iconColor = Colors.white});

  @override
  State<SimpleIconAnimation> createState() => _SimpleIconAnimationState();
}

class _SimpleIconAnimationState extends State<SimpleIconAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: Tween<double>(begin: 0.8, end: 1.2).animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
      ),
      child: Icon(
        Icons.arrow_forward,
        color: widget.iconColor,
        size: 32,
      ),
    );
  }
}