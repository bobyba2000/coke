import 'dart:ui';

import 'package:coke_platform/constants/color.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final String title;
  final VoidCallback onTap;
  const CustomButton({super.key, required this.title, required this.onTap});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    final foreground = isHover ? Colors.white : ColorConstants.colorEA213C;
    final background = isHover ? ColorConstants.colorEA213C : null;
    return InkWell(
      onTap: widget.onTap,
      onHover: (value) {
        isHover = value;
        setState(() {});
      },
      child: CustomPaint(
        painter: BrokenBorderPainter(),
        child: AnimatedContainer(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: background,
          ),
          constraints: const BoxConstraints(minWidth: 100, maxHeight: 30),
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
          margin: const EdgeInsets.all(6),
          duration: const Duration(milliseconds: 200),
          child: Text(
            widget.title,
            style: TextStyle(
              fontSize: 16,
              color: foreground,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class BrokenBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const double borderRadius = 20.0;
    const double strokeWidth = 1.0;
    final List<Map<String, double>> breaks = [
      {'start': 40, 'width': 20}, // Break 1
      {'start': 240, 'width': 20}, // Break 2
    ];

    final paint = Paint()
      ..color = ColorConstants.colorEA213C
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    final rect = Rect.fromLTWH(
      0 + strokeWidth / 2,
      0 + strokeWidth / 2,
      size.width - strokeWidth,
      size.height - strokeWidth,
    );

    final rrect = RRect.fromRectAndRadius(
      rect,
      const Radius.circular(borderRadius),
    );

    final path = Path()..addRRect(rrect);

    // Define the border path with breaks
    PathMetrics pathMetrics = path.computeMetrics();
    for (PathMetric pathMetric in pathMetrics) {
      double length = pathMetric.length;

      double currentOffset = 0.0;
      for (var breakData in breaks) {
        final index = breaks.indexOf(breakData);
        double breakStart = breakData['start']!;
        double breakWidth = breakData['width']!;

        // Draw the path up to the break
        if (currentOffset < breakStart) {
          Path borderSegment1 = pathMetric.extractPath(currentOffset, breakStart);
          canvas.drawPath(borderSegment1, paint);
        }

        // Skip the break
        currentOffset = breakStart + breakWidth;

        // // Draw the path after the break
        if (currentOffset < length && index == breaks.length - 1) {
          Path borderSegment2 = pathMetric.extractPath(currentOffset, length);
          canvas.drawPath(borderSegment2, paint);
        }
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
