import 'package:flutter/material.dart';
import 'dart:math' as math;

@immutable
class PolygonPainter extends CustomPainter {
  final double sides;
  final double radius;
  final double radians;
  final PaintingStyle style;
  final Color color;
  final Widget child;

  PolygonPainter(
      {this.sides = 3,
      this.radius = 150,
      this.radians = 0,
      this.style = PaintingStyle.fill,
      this.color = Colors.black,
      this.child});

  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = this.color;
    if (this.style == PaintingStyle.fill) {
      paint.style = this.style;
    } else if (this.style == PaintingStyle.stroke) {
      paint.style = this.style;
      paint.strokeWidth = 2.0;
    }

    var path = Path();
    var angle = (math.pi * 2) / sides;

    Offset center = Offset(size.width / 2, size.height / 2);
    Offset startPoint =
        Offset(radius * math.cos(radians), radius * math.sin(radians));

    path.moveTo(startPoint.dx + center.dx, startPoint.dy + center.dy);

    for (int i = 1; i <= sides; i++) {
      double x = radius * math.cos(radians + angle * i) + center.dx;
      double y = radius * math.sin(radians + angle * i) + center.dy;
      path.lineTo(x, y);
    }
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(PolygonPainter oldDelegate) {
    return true;
  }
}
