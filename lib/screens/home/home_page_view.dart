import 'package:flutteflix/model/search.dart';
import 'package:flutteflix/screens/home/home_page.dart';
import 'package:flutteflix/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class HomePageView extends StatefulWidget {
  final List<Search> filmes;

  HomePageView({this.filmes});
  @override
  _HomePageViewState createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView>
    with AutomaticKeepAliveClientMixin {
  PageController cotrollerPage = PageController(
    initialPage: 0,
    keepPage: true,
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        PageView(
          scrollDirection: Axis.vertical,
          controller: cotrollerPage,
          children: <Widget>[
            HomePage(
              filmes: widget.filmes,
            )
          ],
        ),
        Positioned(
          top: 0,
          bottom: 0,
          child: CustomAppBar(
            filmes: widget.filmes,
          ),
        )
      ],
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
