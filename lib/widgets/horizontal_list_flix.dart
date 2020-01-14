import 'package:flutteflix/styles/style_flix.dart';
import 'package:flutter/material.dart';

class HorizotalListFlix extends StatelessWidget {
  final String titulo;
  final int itemCount;
  final double altura;
  final Widget tituloWidget;
  final Function(BuildContext, int) itemBuilder;

  const HorizotalListFlix(
      {Key key,
      this.titulo,
      this.itemCount,
      this.itemBuilder,
      this.tituloWidget,
      this.altura = 250})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        tituloWidget ??
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                titulo,
                style: whiteBoldStyle,
              ),
            ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: altura,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: itemCount,
            itemBuilder: itemBuilder,
          ),
        )
      ],
    );
  }
}
