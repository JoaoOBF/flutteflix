import 'package:flutter/material.dart';

class ButtomFlix extends StatelessWidget {
  final String txt;
  final Color corB;
  final Color corT;
  final IconData icone;

  const ButtomFlix({Key key, this.txt, this.corB, this.corT, this.icone})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: corB,
      ),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(
              icone,
              color: corT,
            ),
          ),
          Text(
            txt,
            style: TextStyle(color: corT, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
