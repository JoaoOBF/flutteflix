import 'package:flutteflix/model/search.dart';
import 'package:flutteflix/screens/detalhe/opcoes_semelhantes_tab.dart';
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
  PageController controller = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        PageView(
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          controller: controller,
          children: <Widget>[
            HomePage(
              filmes: widget.filmes,
            ),
            HomePage(
              filmes: widget.filmes,
            ),
            Padding(
                padding: EdgeInsets.only(top: 30),
                child: OpcoesSemelhantesTab()),
          ],
        ),
        new Positioned(
          top: 0.0,
          left: 0.0,
          right: 0.0,
          child: CustomAppBar(filmes: widget.filmes, controller: controller),
        )
      ],
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
