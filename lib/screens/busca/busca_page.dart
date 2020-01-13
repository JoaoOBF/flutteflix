import 'package:flutteflix/model/search.dart';
import 'package:flutteflix/styles/style_flix.dart';
import 'package:flutteflix/widgets/search_view_widget.dart';
import 'package:flutter/material.dart';

class BuscaPage extends StatefulWidget {
  final List<Search> filmes;

  const BuscaPage({Key key, this.filmes}) : super(key: key);

  @override
  _BuscaPageState createState() => _BuscaPageState();
}

class _BuscaPageState extends State<BuscaPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Container(
        color: Colors.black,
        child: Column(
          children: <Widget>[SearchViewWidget(), Expanded(child: _listView())],
        ),
      ),
    );
  }

  Widget _listView() {
    return ListView.builder(
      itemCount: widget.filmes.length,
      itemBuilder: (context, index) {
        if (index == 0) {
          return Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(25),
                width: MediaQuery.of(context).size.height,
                color: darkGreyF,
                child: Text(
                  'Busca populares',
                  style: whiteBoldStyle,
                ),
              ),
              _buildItem(widget.filmes[index]),
            ],
          );
        }
        return Container(
          child: _buildItem(widget.filmes[index]),
        );
      },
    );
  }

  _buildItem(Search item) {
    return Container(
      margin: EdgeInsets.only(top: 3),
      color: darkGreyLight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(right: 15),
                  width: 160,
                  height: 90,
                  child: Image.network(
                    item.poster,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(child: Text(item.title)),
              ],
            ),
          ),
          Flexible(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.play_arrow,
              color: Colors.white,
            ),
          ))
        ],
      ),
    );
  }
}
