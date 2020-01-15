import 'package:flutteflix/widgets/picker_temp.dart';
import 'package:flutter/material.dart';

class TemporadaList extends StatefulWidget {
  @override
  _TemporadaListState createState() => _TemporadaListState();
}

class _TemporadaListState extends State<TemporadaList> {
  String temporada = "Temporada 1";
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(PageRouteBuilder(
              opaque: false,
              pageBuilder: (BuildContext context, _, __) => PickeTemp(
                    temp: temporada,
                    callback: (s) {
                      temporada = s;
                      setState(() {});
                    },
                  )));
        },
        child: Container(
          color: Color.fromRGBO(51, 51, 51, 1),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                temporada,
                style: TextStyle(color: Colors.grey),
              ),
              Icon(
                Icons.arrow_drop_down,
                color: Colors.grey,
              )
            ],
          ),
        ),
      ),
    );
  }
}
