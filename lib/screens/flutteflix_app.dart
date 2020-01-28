import 'package:flutteflix/screens/tab_page.dart';
import 'package:flutteflix/styles/style_flix.dart';
import 'package:flutter/material.dart';

class FlutteFlixApp extends StatefulWidget {
  @override
  _FlutteFlixAppState createState() => _FlutteFlixAppState();
}

class _FlutteFlixAppState extends State<FlutteFlixApp> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: new ThemeData(
          primaryColor: redFlix,
          scaffoldBackgroundColor: darkGrey,
          textTheme: new TextTheme(
            body1: new TextStyle(color: Colors.white),
          ),
        ),
        home: TabPage());
  }
}
