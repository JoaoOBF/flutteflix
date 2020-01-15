import 'package:flutteflix/screens/detalhe/tab_bar_detalhes.dart';
import 'package:flutteflix/styles/style_flix.dart';
import 'package:flutteflix/widgets/like_widget.dart';
import 'package:flutteflix/widgets/player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class DetalhesSerie extends StatelessWidget {
  final String descricao =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              backgroundColor: blackFlix,
              flexibleSpace: FlexibleSpaceBar(
                background: Player(
                  autoPlay: false,
                ),
              ),
            ),
          ];
        },
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Drácula"),
            relevancia(),
            Text(
              descricao,
              style: TextStyle(color: Colors.grey),
            ),
            Text(
              'Elenco: Devan Cohen, Owen Mason, Kallan Holley\nCriação: Keith Chapman',
              textAlign: TextAlign.start,
              style: TextStyle(color: Colors.grey),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                _item('Minha lista', Icons.add, context),
                SizedBox(
                  width: 30,
                ),
                _item('Classifique', EvilIcons.like, context),
                SizedBox(
                  width: 30,
                ),
                _item('Compartilhe', Icons.share, context)
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Divider(
              height: 3,
              color: Colors.black,
            ),
            Expanded(child: TabBarDetalhes())
          ],
        ),
      ),
    );
  }

  Widget relevancia() {
    return Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 3, right: 3),
        ),
        Text(
          "91% relevante",
          style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: EdgeInsets.only(left: 3, right: 3),
        ),
        Text(
          "2018",
          style: TextStyle(color: Colors.grey),
        ),
        Padding(
          padding: EdgeInsets.only(left: 3, right: 3),
        ),
        Container(
          margin: EdgeInsets.only(top: 5, bottom: 5),
          padding: EdgeInsets.only(left: 7, right: 7, top: 3, bottom: 3),
          color: Colors.green,
          child: Text(
            'L',
            style: TextStyle(color: Colors.white),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 3, right: 3),
        ),
        Text(
          "1 Temporadas",
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }

  Widget _item(String txt, IconData icone, BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        GestureDetector(
          onTapUp: (TapUpDetails details) {
            Offset pos =
                Offset(details.globalPosition.dx, details.globalPosition.dy);
            Navigator.of(context).push(PageRouteBuilder(
                opaque: false,
                pageBuilder: (BuildContext context, _, __) => LikeWidget(
                      pos: pos,
                    )));
          },
          child: Hero(
            tag: txt,
            child: Icon(
              icone,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(
          height: 3,
        ),
        Text(
          txt,
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }

  var _colorsTopGradientAvaliacao = [
    Color.fromRGBO(26, 26, 26, 1.0).withOpacity(0.6),
    Color.fromRGBO(26, 26, 26, 1.0).withOpacity(0.7),
    Color.fromRGBO(26, 26, 26, 1.0).withOpacity(0.8),
    Color.fromRGBO(26, 26, 26, 1.0)
  ];

  var _colorsBottomGradientAvaliacao = [
    Color.fromRGBO(26, 26, 26, 1.0),
    Color.fromRGBO(26, 26, 26, 1.0).withOpacity(0.8),
    Color.fromRGBO(26, 26, 26, 1.0).withOpacity(0.7),
    Color.fromRGBO(26, 26, 26, 1.0).withOpacity(0.5),
  ];

  Widget _containerGradient({var altura, List<Color> colors}) {
    return Container(
        height: altura,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: _colorsTopGradientAvaliacao,
          stops: [0.1, 0.4, 0.6, 0.9],
          begin: const Alignment(0.0, 0.8),
          end: const Alignment(0.0, -0.6),
        )));
  }
}
