import 'package:flutteflix/screens/detalhe/episodios_tab.dart';
import 'package:flutteflix/screens/detalhe/opcoes_semelhantes_tab.dart';
import 'package:flutter/material.dart';

class TabBarDetalhes extends StatefulWidget {
  @override
  _TabBarDetalhesState createState() => _TabBarDetalhesState();
}

class _TabBarDetalhesState extends State<TabBarDetalhes>
    with TickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 2);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[tabBar(), Flexible(child: getTabBarPages())],
    );
  }

  Widget getTabBarPages() {
    return TabBarView(controller: _tabController, children: <Widget>[
      Container(
        child: EpisodiosTab(),
      ),
      Container(
        child: OpcoesSemelhantesTab(),
      ),
    ]);
  }

  Widget tabBar() {
    return TabBar(
      indicatorColor: Theme.of(context).primaryColor,
      labelColor: Theme.of(context).buttonColor,
      unselectedLabelColor: Theme.of(context).splashColor,
      controller: _tabController,
      tabs: <Widget>[
        Text(
          "Episódios",
          textAlign: TextAlign.center,
        ),
        Tab(text: "Opções semelhantes"),
//          Tab(text: "OPCIONAIS"),
      ],
    );
  }
}
