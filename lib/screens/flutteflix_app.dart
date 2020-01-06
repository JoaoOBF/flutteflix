import 'package:flutteflix/screens/home/home_page.dart';
import 'package:flutteflix/styles/style_flix.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class FlutteFlixApp extends StatefulWidget {
  @override
  _FlutteFlixAppState createState() => _FlutteFlixAppState();
}

class _FlutteFlixAppState extends State<FlutteFlixApp> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        theme: new ThemeData(
          primaryColor: redFlix,
          scaffoldBackgroundColor: darkGrey,
          textTheme: new TextTheme(
            body1: new TextStyle(color: Colors.white),
          ),
        ),
        home: DefaultTabController(
          length: 5,
          child: Scaffold(
            body: TabBarView(
              children: [
                HomePage(),
                Container(child: Icon(Icons.directions_transit)),
                Container(child: Icon(Icons.directions_bike)),
                Container(child: Icon(Icons.directions_bike)),
                Container(child: Icon(Icons.directions_bike)),
              ],
            ),
            bottomNavigationBar: menu(),
          ),
        ));
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
