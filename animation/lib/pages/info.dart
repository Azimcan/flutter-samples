import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:animation/widgets/animated/ripple.dart';
import 'package:animation/routes/fadeInFadeOutRoute.dart';
import 'breathPage.dart';

class Info extends StatefulWidget {
  Info({Key key}) : super(key: key);
  @override
  _State createState() => new _State();
}

class _State extends State<Info> {
  void _newPage() {
    setState(() {
      Navigator.pop(context);
      Navigator.push(
        context,
        FadeInFadeOutRoute(builder: (context) => new BreathPage()),
      );
    });
  }

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
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
          child: Center(
            child: Ripple(
              diameter: 200,
              child: IconButton(
                icon: Icon(Icons.arrow_forward_outlined),
                color: Colors.redAccent,
                iconSize: 45,
                tooltip: "New Page",
                onPressed: _newPage,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
