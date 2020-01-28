import 'dart:io';

import 'package:flutteflix/common/flix_images.dart';
import 'package:flutteflix/model/search.dart';
import 'package:flutteflix/screens/detalhe/detalhe_serie.dart';
import 'package:flutteflix/styles/style_flix.dart';
import 'package:flutteflix/widgets/button_flix.dart';
import 'package:flutteflix/widgets/custom_app_bar.dart';
import 'package:flutteflix/widgets/header.dart';
import 'package:flutteflix/widgets/horizontal_list_flix.dart';
import 'package:flutteflix/widgets/player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HomePage extends StatefulWidget {
  final List<Search> filmes;

  const HomePage({Key key, this.filmes}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, //or set color with: Color(0xFF0000FF)
    ));
    var listView = ListView(
      children: <Widget>[
        Header(),
        HorizotalListFlix(
          altura: 120,
          titulo: "Prévias",
          itemCount: fts.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 4.0, right: 4.0),
              child: _image(url: fts[index], rounded: true),
            );
          },
        ),
        HorizotalListFlix(
          titulo: "Populares na Netflix",
          itemCount: widget.filmes.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 4.0, right: 4.0),
              child: Image.network(
                widget.filmes[index].poster,
              ),
            );
          },
        ),
        _disponivel(),
        HorizotalListFlix(
          titulo: "Populares na Netflix",
          itemCount: widget.filmes.length,
          itemBuilder: (context, index) {
            return _continuarAssistindoItem(widget.filmes[index]);
          },
        ),
        HorizotalListFlix(
          titulo: "Populares na Netflix",
          itemCount: widget.filmes.length,
          itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                child: _image(url: widget.filmes[index].poster));
          },
        ),
        HorizotalListFlix(
          tituloWidget: Row(
            children: <Widget>[
              Text("Originais netflix"),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 12,
              )
            ],
          ),
          altura: 300,
          itemCount: widget.filmes.length,
          itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                child:
                    _image(url: widget.filmes[index].poster, largura: 130.0));
          },
        ),
        HorizotalListFlix(
          titulo: "Populares na Netflix",
          itemCount: widget.filmes.length,
          itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                child: _image(url: widget.filmes[index].poster));
          },
        ),
      ],
    );
    return Container(child: listView);
  }

  Widget _continuarAssistindoItem(Search item) {
    return Padding(
      padding: const EdgeInsets.only(left: 4.0, right: 4.0),
      child: Stack(
        children: <Widget>[
          _image(url: item.poster),
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Container(
                height: 65,
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
                    size: 50,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: 170,
                padding: EdgeInsets.only(top: 5, bottom: 5),
                color: Colors.black,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 4.0),
                      child: Text(
                        "kkkkkkkkk",
                        style: greyStyle,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: Icon(
                        Icons.error_outline,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }

  _image({String url, bool rounded = false, var largura = 170.0}) {
    return InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DetalhesSerie()),
          );
        },
        child: rounded
            ? ClipRRect(
                borderRadius: new BorderRadius.circular(8.0),
                child: Image.asset(
                  url,
                  height: 80.0,
                  width: 100.0,
                ),
              )
            : Container(
                width: largura,
                child: Image.network(
                  url,
                  fit: BoxFit.cover,
                ),
              ));
  }

  _disponivel() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Já disponivel: Temporada 1"),
        Player(),
        Row(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                child: ButtomFlix(
                  txt: 'Assistir',
                  corB: Colors.white,
                  corT: Colors.black,
                  icone: Icons.play_arrow,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                child: ButtomFlix(
                  txt: 'Minha lista',
                  corT: Colors.white,
                  corB: darkGreyF,
                  icone: Icons.add,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
