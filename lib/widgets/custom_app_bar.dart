import 'package:flutteflix/model/search.dart';
import 'package:flutteflix/screens/home/home_page.dart';
import 'package:flutteflix/styles/style_flix.dart';
import 'package:flutteflix/widgets/text_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class CustomAppBar extends StatefulWidget {
  final String tag;
  final List<Search> filmes;
  PageController controller;

  CustomAppBar({this.tag, this.filmes, this.controller});

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar>
    with TickerProviderStateMixin {
  bool showSerie = false;
  bool showList = false;
  bool showFilme = false;
  AnimationController _controller;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: blackFlix,
        height: 40,
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: GestureDetector(
                onTap: () {
                  showFilme = false;
                  showList = false;
                  showSerie = false;
                  _controller.reverse();
                  setState(() {});
                },
                child: Image.asset(
                  'assets/poster/net.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Offstage(
              offstage: showSerie,
              child: TextAnimation(
                  begin: Alignment.topCenter,
                  txt: "Séries",
                  isAnimating: (c) {
                    _controller = c;
                    isAnimation("Séries");
                  }),
            ),
            Offstage(
              offstage: showFilme,
              child: TextAnimation(
                  begin: Alignment.topLeft,
                  txt: "Filmes",
                  padding: EdgeInsets.only(left: 40.0),
                  isAnimating: (c) {
                    _controller = c;
                    isAnimation("Filmes");
                  }),
            ),
            Offstage(
              offstage: showList,
              child: TextAnimation(
                  begin: Alignment.topRight,
                  txt: "Minha Lista",
                  padding: EdgeInsets.only(right: 25.0),
                  isAnimating: (c) {
                    _controller = c;
                    isAnimation("Minha Lista");
                  }),
            ),
          ],
        ),
      ),
    );
  }

  void isAnimation(String txt) {
    showFilme = !(txt == "Filmes");
    showList = !(txt == "Minha Lista");
    showSerie = !(txt == "Séries");
    setState(() {});
    Map page = {
      "Filmes": 0,
      "Séries": 1,
      "Minha Lista": 2,
    };
    widget.controller.animateToPage(page[txt],
        duration: Duration(milliseconds: 800), curve: Curves.easeIn);
  }
}

/*
HomePage(
                          tag: tagHero,
                          filmes: filmes,
                        )
                        */
