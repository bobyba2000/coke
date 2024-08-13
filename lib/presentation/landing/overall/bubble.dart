import 'package:flutter/material.dart';

class WaterBubble extends StatefulWidget {
  final Color color;
  const WaterBubble({super.key, required this.color});

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

    _animation = Tween<double>(begin: 0, end: 15).animate(
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
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [Colors.transparent, color.withOpacity(0.8)],
                  center: const Alignment(-0.3, -0.3),
                  radius: 0.8,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.2),
                    blurRadius: 10,
                    spreadRadius: 5,
                  ),
                ],
              ),
            ),
            Positioned(
              top: _animation.value,
              left: _animation.value,
              child: ClipOval(
                child: Container(
                  width: 20,
                  height: 20,
                  color: color.withOpacity(0.6),
                ),
              ),
            ),
            Positioned(
              bottom: _animation.value,
              right: _animation.value,
              child: ClipOval(
                child: Container(
                  width: 10,
                  height: 10,
                  color: Colors.white.withOpacity(0.3),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
