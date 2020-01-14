import 'package:flutter/material.dart';

class PickeTemp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Stack(
        children: <Widget>[
          Center(
            child: new ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.all(20.0),
                children: [
                  Center(child: new Text('Tempora 1')),
                  Center(child: new Text('Tempora 2')),
                  Center(child: new Text('Tempora 3'))
                ]),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 45,
              decoration: new BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () => Navigator.of(context).pop(),
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
