import 'package:flutteflix/styles/style_flix.dart';
import 'package:flutter/material.dart';

class MaisPage extends StatefulWidget {
  @override
  _MaisPageState createState() => _MaisPageState();
}

class _MaisPageState extends State<MaisPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[header(), _mylist(), configs()],
    );
  }

  Widget perfil() {
    return Column(
      children: <Widget>[
        Container(
          width: 50,
          height: 50,
          child: Image.network(
            "https://mir-s3-cdn-cf.behance.net/project_modules/disp/366be133850498.56ba69ac36858.png",
          ),
        ),
        Text("perfil")
      ],
    );
  }

  Widget header() {
    return Container(
      color: darkGreyF,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              perfil(),
              perfil(),
              perfil(),
              perfil(),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.edit,
                color: Colors.grey,
              ),
              Text(
                'Gerenciar perfis',
                style: TextStyle(
                  color: Colors.grey,
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  Widget _mylist() {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.check,
            color: Colors.grey,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              'Minha lista',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget configs() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        itemConfig('Configuração do aplicativo'),
        itemConfig('Conta'),
        itemConfig('Ajuda'),
        itemConfig('Sair'),
      ],
    );
  }

  Widget itemConfig(String txt) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {},
        child: Text(
          txt,
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
