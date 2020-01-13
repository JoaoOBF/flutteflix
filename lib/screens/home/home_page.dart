import 'package:flutteflix/model/search.dart';
import 'package:flutteflix/screens/home/bloc/home_bloc.dart';
import 'package:flutteflix/styles/style_flix.dart';
import 'package:flutteflix/widgets/horizontal_list_flix.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final List<Search> filmes;
  const HomePage({Key key, this.filmes}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
      children: <Widget>[
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
                child: _image(widget.filmes[index].poster));
          },
        ),
        HorizotalListFlix(
          titulo: "Populares na Netflix",
          itemCount: widget.filmes.length,
          itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                child: _image(widget.filmes[index].poster));
          },
        ),
        HorizotalListFlix(
          titulo: "Populares na Netflix",
          itemCount: widget.filmes.length,
          itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                child: _image(widget.filmes[index].poster));
          },
        ),
      ],
    ));
  }

  Widget _continuarAssistindoItem(Search item) {
    return Padding(
      padding: const EdgeInsets.only(left: 4.0, right: 4.0),
      child: Stack(
        children: <Widget>[
          _image(item.poster),
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

  _image(String url) {
    return Container(
      width: 170,
      child: Image.network(
        url,
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
