import 'package:flutter/material.dart';

class HorizotalListFlix extends StatelessWidget {
  final String titulo;
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;

  const HorizotalListFlix(
      {Key key, this.titulo, this.itemCount, this.itemBuilder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(titulo),
        ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: itemCount,
          itemBuilder: itemBuilder,
        )
      ],
    );
  }
}
