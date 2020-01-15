import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class LikeWidget extends StatefulWidget {
  final Offset pos;

  const LikeWidget({Key key, this.pos}) : super(key: key);

  @override
  _LikeWidgetState createState() => _LikeWidgetState();
}

class _LikeWidgetState extends State<LikeWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Stack(
        children: <Widget>[
          Marker(
            x: widget.pos.dx,
            y: widget.pos.dy,
          )
        ],
      ),
    );
  }
}

class Marker extends StatelessWidget {
  final double x;
  final double y;

  Marker({this.x: 0.0, this.y: 0.0});

  @override
  Widget build(BuildContext context) {
    print("x: $x, y: $y");

    return Positioned(
      left: x,
      top: y,
      child: Hero(
        tag: 'Classifique',
        child: Container(
          height: 30,
          decoration: new BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: IconButton(
              iconSize: 15,
              icon: Icon(
                EvilIcons.like,
              ),
              onPressed: () => Navigator.of(context).pop(),
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
