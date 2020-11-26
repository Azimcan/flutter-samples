import 'package:flutter/material.dart';
import 'package:animation/widgets/painters/polygonPainter.dart';

@immutable
class Pentagon extends StatelessWidget {
  Pentagon({this.radius, this.radians, this.color, this.child});
  final double radius;
  final double radians;
  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return new Container(
      alignment: Alignment.center,
      width: this.radius,
      height: this.radius,
      child: CustomPaint(
        painter: PolygonPainter(
          sides: 5,
          radius: this.radius,
          radians: this.radians,
          style: PaintingStyle.fill,
          color: this.color,
        ),
        child: this.child,
      ),
    );
  }
}
