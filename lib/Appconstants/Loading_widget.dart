import 'package:flutter/material.dart';

class AdvancedLoadingWidget extends StatefulWidget {
  final String? message;

  const AdvancedLoadingWidget({super.key, this.message});

  @override
  State<AdvancedLoadingWidget> createState() => _AdvancedLoadingWidgetState();
}

class _AdvancedLoadingWidgetState extends State<AdvancedLoadingWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) {
                  final offset = (index * 0.3);
                  final value =
                  (1 - ((_controller.value + offset) % 1.0)).clamp(0.0, 1.0);
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Opacity(
                      opacity: value,
                      child: const CircleAvatar(
                        radius: 6,
                        backgroundColor: Colors.orange,
                      ),
                    ),
                  );
                }),
              );
            },
          ),
          const SizedBox(height: 16),
          if (widget.message != null)
            Text(
              widget.message!,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
        ],
      ),
    );
  }
}
