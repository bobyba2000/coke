import 'package:flutter/material.dart';

class WaterBubble extends StatefulWidget {
  final double size;
  final Color color;
  final Widget child;
  const WaterBubble({
    super.key,
    required this.color,
    required this.size,
    required this.child,
  });

  @override
  State<WaterBubble> createState() => _WaterBubbleState();
}

class _WaterBubbleState extends State<WaterBubble> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0, end: 30).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = widget.color;
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: widget.size,
              height: widget.size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    color.withOpacity(0.1),
                    color.withOpacity(0.3),
                  ],
                  radius: 0.8,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(
                      0.2,
                    ),
                    blurRadius: _animation.value,
                    spreadRadius: _animation.value,
                  ),
                ],
              ),
              alignment: Alignment.center,
              child: widget.child,
            ),
          ],
        );
      },
    );
  }
}
