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
          Flexible(
            child: Padding(
              padding: EdgeInsets.only(right: tag == null ? 8.0 : 0, left: 8),
              child: Hero(
                  tag: 'topBarBtn',
                  child: Icon(
                    Ionicons.logo_android,
                    color: Colors.red,
                  )),
            ),
          ),
          tag != null
              ? Flexible(
                  flex: 5,
                  child: Container(
                    child: _textWidget(
                      context,
                      tag,
                    ),
                  ),
                )
              : Container(),
          Expanded(
            flex: 5,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
        onTap: () {},
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
