import 'package:flutteflix/screens/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeBloc _bloc;

  @override
  void initState() {
    _bloc = HomeBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<Object>(
          stream: _bloc.subject,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Container(
                child: Center(
                  child: Text("FlutteFlix"),
                ),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
