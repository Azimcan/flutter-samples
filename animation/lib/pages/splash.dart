import 'package:flutter/material.dart';
import 'dart:async';

import '../routes/fadeInFadeOutRoute.dart';
import 'info.dart';

class Splash extends StatefulWidget {
  Splash({Key key}) : super(key: key);
  @override
  _State createState() => new _State();
}

class _State extends State<Splash> {
  Duration duration = const Duration(seconds: 3);

  // duration degeri kadar bekletip handleTimeout metodunu cagirir
  startTimeout() {
    return new Timer(duration, handleTimeout);
  }

  // Yeni ekrani acilmasini saglar
  void handleTimeout() {
    Navigator.pop(context);
    Navigator.push(
      context,
      FadeInFadeOutRoute(builder: (context) => new Info()),
    );
  }

  // Widget acildiginda cagrilir ve sayaci baslatir
  initState() {
    super.initState();
    this.startTimeout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage("images/1.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
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
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
