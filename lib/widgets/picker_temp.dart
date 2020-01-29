import 'package:flutter/material.dart';

class PickeTemp extends StatelessWidget {
  final Function(String s) callback;
  final String temp;
  final List<Widget> list;

  const PickeTemp({Key key, this.callback, this.temp, this.list})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Stack(
        children: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 60),
              child: new ListView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(20.0),
                  children: list ??
                      [
                        txt('Temporada 1', context),
                        txt('Temporada 2', context),
                        txt('Temporada 3', context)
                      ]),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
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
          ),
        ],
      ),
    );
  }

  Widget txt(String s, BuildContext context) {
    return InkWell(
      onTap: () {
        callback(s);
        Navigator.of(context).pop();
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
            child: new Text(
          s,
          style: temp == s
              ? TextStyle(fontSize: 25, fontWeight: FontWeight.bold)
              : TextStyle(fontSize: 20),
        )),
      ),
    );
  }
}
