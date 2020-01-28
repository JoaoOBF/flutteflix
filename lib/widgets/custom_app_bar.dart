import 'package:flutteflix/model/search.dart';
import 'package:flutteflix/screens/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class CustomAppBar extends StatelessWidget {
  final String tag;
  final List<Search> filmes;

  CustomAppBar({this.tag, this.filmes});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: tag == null ? 8.0 : 0, left: 8),
            child: Hero(
                tag: 'topBarBtn',
                child: Icon(
                  Ionicons.logo_android,
                  color: Colors.red,
                )),
          ),
          tag != null
              ? Flexible(
                  child: Container(
                    child: _textWidget(
                      context,
                      tag,
                    ),
                  ),
                )
              : Container(),
          Expanded(
            child: Container(
              child: Row(
                children: <Widget>[
                  tag == null ? _textWidget(context, "Séries") : Container(),
                  tag == null ? _textWidget(context, "Filmes") : Container(),
                  tag == null
                      ? _textWidget(context, "Minha Lista")
                      : Container(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _textWidget(BuildContext context, String tagHero) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(PageRouteBuilder<Null>(
            pageBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
            ) =>
                HomePage(
              tag: tagHero,
              filmes: filmes,
            ),
            transitionsBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child,
            ) =>
                FadeTransition(
              opacity: animation,
              child: child,
            ),
          ));
        },
        child: Hero(
          tag: tagHero,
          child: Container(
              child: Material(
            color: Colors.transparent,
            child: Text(
              tagHero,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          )),
        ),
      ),
    );
  }
}

/*
HomePage(
                          tag: tagHero,
                          filmes: filmes,
                        )
                        */
