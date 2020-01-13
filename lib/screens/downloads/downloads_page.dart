import 'package:flutteflix/styles/style_flix.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class DownloadsPage extends StatefulWidget {
  @override
  _DownloadsPageState createState() => _DownloadsPageState();
}

class _DownloadsPageState extends State<DownloadsPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[_bar(), centerWidget(), botao()],
    );
  }

  Widget _bar() {
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.black,
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Icon(
              Icons.info_outline,
              color: Colors.white,
            ),
          ),
          RichText(
            text: TextSpan(
              text: 'Smart Download  ',
              style: DefaultTextStyle.of(context).style,
              children: <TextSpan>[
                TextSpan(
                    text: 'ATIVADO',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.blueAccent)),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget centerWidget() {
    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(20.0),
          decoration: new BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey[600],
          ),
          child: Center(
            child: Icon(
              Feather.download,
              size: 110,
              color: Colors.black,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            'Os filmes e séries baixados ficam aqui.',
            style: TextStyle(
              color: Colors.grey[600],
            ),
          ),
        ),
      ],
    );
  }

  Widget botao() {
    return Container(
      margin:
          EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.10),
      decoration: new BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.grey[600],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text("Encontre um título para baixar"),
      ),
    );
  }
}
