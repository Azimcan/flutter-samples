import 'package:animation/widgets/shapes/circle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class Breath extends StatefulWidget {
  Breath({this.diameter, this.child});
  final double diameter;
  final Widget child;
  _State createState() => new _State(diameter, child);
}

class _State extends State<Breath> with SingleTickerProviderStateMixin {
  _State(this.diameter, this.child);

  final double diameter;
  final Widget child;
  Animation<double> animation;
  AnimationController controller;

  var breath = 0.0;

  void initState() {
    super.initState();
    // 5 saniyelik bir animasyonu kontrol edecek controller oluşturur
    controller = new AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    animation = new Tween(begin: 0.0, end: diameter * 1.7).animate(controller);
    animation.addListener(() {
      setState(() {});
    });
    // Animasyonun tekrarli olmasini saglar
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
    controller.addListener(() {
      setState(() {
        breath = controller.value.toDouble() * 0.5;
      });
    });
    controller.forward();
  }

  Widget build(BuildContext context) {
    final r = diameter - 15.0 * breath;
    return Container(
      width: diameter,
      height: diameter,
      child: Stack(children: [
        Center(
          child: Circle(
            diameter: r,
            color: Colors.white.withOpacity(0.5),
          ),
        ),
        Center(child: child),
      ]),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
