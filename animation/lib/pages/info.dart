import 'package:animation/widgets/animated/ripple.dart';
import 'package:flutter/material.dart';

class Info extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: new BoxDecoration(
          image: DecorationImage(
            image: new AssetImage('images/2.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Ripple(
            diameter: 200,
            child: Text(
              'Info',
              textDirection: TextDirection.ltr,
              style: TextStyle(
                fontSize: 50.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
