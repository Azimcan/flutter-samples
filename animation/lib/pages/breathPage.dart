import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:animation/widgets/animated/breath.dart';
import 'package:animation/routes/fadeInFadeOutRoute.dart';
import 'info.dart';

class BreathPage extends StatefulWidget {
  BreathPage({Key key}) : super(key: key);
  @override
  _State createState() => new _State();
}

class _State extends State<BreathPage> {
  void _infoPage() {
    setState(() {
      Navigator.pop(context);
      Navigator.push(
        context,
        FadeInFadeOutRoute(builder: (context) => new Info()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: new BoxDecoration(
          image: DecorationImage(
            image: new AssetImage('images/3.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
          child: Center(
            child: Breath(
              diameter: 100,
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                color: Colors.redAccent,
                iconSize: 45,
                tooltip: "Info",
                onPressed: _infoPage,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
