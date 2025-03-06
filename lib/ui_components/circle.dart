import 'package:flutter/material.dart';

class MultiColorProgressPainter extends CustomPainter {
  final double progress;

  MultiColorProgressPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    const double strokeWidth = 6.0;

    final Rect rect = Offset.zero & size;

    final Paint backgroundPaint = Paint()
      ..color = Colors.grey.shade200
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final Paint progressPaint = Paint()
      ..shader = SweepGradient(
        startAngle: 0.0,
        endAngle: 3.1415 * 2,
        colors: const [
          Colors.blue,
          Colors.green,
          Colors.orange,
          Colors.red,
        ],
        stops: const [0.25, 0.5, 0.75, 1.0],
      ).createShader(rect)
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    // Draw Background Circle
    canvas.drawCircle(size.center(Offset.zero), size.width / 2, backgroundPaint);

    // Draw Progress Arc
    final double angle = 3.1415 * 2 * progress;
    canvas.drawArc(rect, -3.1415 / 2, angle, false, progressPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
