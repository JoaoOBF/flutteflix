import 'package:flutteflix/styles/style_flix.dart';
import 'package:flutter/material.dart';

class SearchViewWidget extends StatefulWidget {
  @override
  _SearchViewWidgetState createState() => _SearchViewWidgetState();
}

class _SearchViewWidgetState extends State<SearchViewWidget>
    with TickerProviderStateMixin {
  TextEditingController _controller;
  AnimationController _animationController;
  Animation<double> transitionTween;
  FocusNode _focus;
  @override
  void initState() {
    _controller = TextEditingController();

    _animationController = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);

    transitionTween = Tween<double>(
      begin: 8.0,
      end: 0.0,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.ease,
      ),
    );
    _focus = new FocusNode();
    _focus.addListener(() {
      if (_focus.hasFocus) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _searchWidget();
  }

  Widget _searchWidget() {
    return AnimatedBuilder(
        animation: _animationController,
        builder: (BuildContext context, Widget child) {
          return Container(
            margin: EdgeInsets.all(transitionTween.value),
            color: Colors.black,
            child: Container(
              color: grey,
              child: ListTile(
                leading: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                title: TextField(
                  focusNode: _focus,
                  controller: _controller,
                  style: TextStyle(color: Colors.white),
                  decoration: new InputDecoration(
                      hintText: 'Busque por série, filme, gênero, etc.',
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: Colors.grey)),
                ),
                trailing: new IconButton(
                  icon: new Icon(
                    Icons.keyboard_voice,
                    color: Colors.grey,
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          );
        });
  }
}
