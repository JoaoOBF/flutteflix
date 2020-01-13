import 'package:flutteflix/model/search.dart';
import 'package:flutteflix/screens/busca/busca_page.dart';
import 'package:flutteflix/screens/downloads/downloads_page.dart';
import 'package:flutteflix/screens/home/bloc/home_bloc.dart';
import 'package:flutteflix/screens/home/home_page.dart';
import 'package:flutteflix/styles/style_flix.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class TabPage extends StatefulWidget {
  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  ApplicationBloc _bloc;

  @override
  void initState() {
    _bloc = ApplicationBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: SafeArea(
        child: Scaffold(
          body: StreamBuilder<List<Search>>(
              stream: _bloc.subject,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return TabBarView(
                    children: [
                      HomePage(
                        filmes: snapshot.data,
                      ),
                      BuscaPage(filmes: snapshot.data),
                      DownloadsPage(),
                      Container(child: Icon(Icons.directions_bike)),
                      Container(child: Icon(Icons.directions_bike)),
                    ],
                  );
                }
              }),
          bottomNavigationBar: menu(),
        ),
      ),
    );
  }

  Widget menu() {
    return Container(
      color: Colors.black,
      child: TabBar(
        isScrollable: true,
        labelColor: Colors.white,
        unselectedLabelColor: Colors.grey,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorColor: Colors.transparent,
        tabs: [
          Tab(
            text: "Início",
            icon: Icon(
              SimpleLineIcons.home,
            ),
          ),
          Tab(
            text: "Buscas",
            icon: Icon(Icons.search),
          ),
          Tab(
            text: "Em breve",
            icon: Icon(Foundation.play_video),
          ),
          Tab(
            text: "Downloads",
            icon: Icon(Feather.download),
          ),
          Tab(
            text: "Mais",
            icon: Icon(Icons.menu),
          ),
        ],
      ),
    );
  }
}
