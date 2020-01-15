import 'package:flutteflix/widgets/picker_temp.dart';
import 'package:flutteflix/widgets/temporada_list.dart';
import 'package:flutter/material.dart';

class EpisodiosTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 35, left: 5),
      child: ListView(
        children: <Widget>[TemporadaList(), corpo(), corpo(), corpo(), corpo()],
      ),
    );
  }

//Color.fromRGBO(51, 51, 51, 1),

  Widget corpo() {
    return Column(children: <Widget>[
      SizedBox(
        height: 10,
      ),
      foto(),
      SizedBox(
        height: 15,
      ),
      Text(
          'There are many variations of passages of Lorem Ipsum available, ' +
              ' but the majority have suffered alteration in some form, ' +
              'by injected humour, or randomised words which dont look even slightly believable.',
          style: TextStyle(color: Colors.grey))
    ]);
  }

  Widget foto() {
    return Row(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              width: 120,
              height: 80,
              child: Image.network(
                "https://uploads.metropoles.com/wp-content/uploads/2019/08/27132706/Neymar1.jpeg",
                fit: BoxFit.cover,
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  height: 45,
                  decoration: new BoxDecoration(
                    color: Colors.black38.withOpacity(0.5),
                    border: new Border.all(
                      color: Colors.white.withOpacity(0.5),
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.play_arrow,
                      size: 45,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          width: 5,
        ),
        Flexible(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                  "1.Os filhotes salvam os pinguins/ Os filhotes salvam um filhote de golfinho",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              Text(
                "23 mim",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        )
      ],
    );
  }
}
