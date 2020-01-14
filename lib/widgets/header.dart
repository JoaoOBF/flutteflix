import 'package:flutteflix/widgets/button_flix.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _header(context);
  }

  Widget _header(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.60,
          child: Image.network(
            'https://assets0.minhaserie.com.br/uploads/editor_pictures/000/076/091/content_pic.jpg',
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          height: 15,
        ),
        typeHeader(),
        SizedBox(
          height: 15,
        ),
        _actionHeader(),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }

  Widget typeHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('Realista'),
        _point(),
        Text('Sombrios'),
        _point(),
        Text('Super-herói'),
        _point(),
        Text('Detetives'),
        _point(),
        Text('Crime'),
      ],
    );
  }

  Widget _point() {
    return Container(
      margin: EdgeInsets.only(left: 5, right: 5),
      width: 5,
      height: 5,
      decoration: new BoxDecoration(
        color: Colors.grey,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _actionHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15),
          child: itemAction("Minha lista", Icons.check),
        ),
        ButtomFlix(
          txt: 'Assistir',
          corB: Colors.white,
          corT: Colors.black,
          icone: Icons.play_arrow,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15),
          child: itemAction("Saiba mais", Icons.info_outline),
        ),
      ],
    );
  }

  Widget itemAction(String titulo, IconData icone) {
    return InkWell(
      child: Column(
        children: <Widget>[
          Icon(
            icone,
            color: Colors.white,
          ),
          Text(titulo)
        ],
      ),
    );
  }
}
