import 'package:flutter/material.dart';

class Refresh_icon_animted extends StatefulWidget {
  final Color iconColor;

  const Refresh_icon_animted({super.key, this.iconColor = Colors.white});

  @override
  State<Refresh_icon_animted> createState() => _Refresh_icon_animtedState();
}

class _Refresh_icon_animtedState extends State<Refresh_icon_animted>
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
        Icons.refresh,
        color: widget.iconColor,
        size: 32,
      ),
    );
  }
}