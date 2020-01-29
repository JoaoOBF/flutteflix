import 'package:flutteflix/widgets/picker_temp.dart';
import 'package:flutter/material.dart';

class TextAnimation extends StatefulWidget {
  final Alignment begin;
  final String txt;
  final EdgeInsetsGeometry padding;
  final Function(AnimationController controller) isAnimating;

  const TextAnimation({
    Key key,
    this.begin,
    this.txt,
    this.padding,
    this.isAnimating,
  }) : super(key: key);
  @override
  _TextAnimationState createState() => _TextAnimationState();
}

class _TextAnimationState extends State<TextAnimation>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<Alignment> _animationLista;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animationLista = AlignmentTween(
      begin: widget.begin,
      end: Alignment.topLeft,
    ).animate(new CurvedAnimation(
        parent: _controller,
        curve: new Interval(0.0, 1.0, curve: Curves.ease)));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget child) {
        return Align(
            alignment: _animationLista.value,
            child: Container(
              padding: _controller.isAnimating || _controller.isCompleted
                  ? EdgeInsets.only(left: 39.0)
                  : widget.padding,
              child: _textWidget(),
            ));
      },
    );
  }

  Widget _textWidget() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: _controller.isCompleted
          ? Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () async {
                    if (_controller.isCompleted) {
                      _controller.reset();
                      _controller.forward();
                    } else {
                      _controller.forward();
                    }
                    widget.isAnimating(_controller);
                    // controller.jumpTo(0);
                    //  controller.nextPage(  duration: Duration(milliseconds: 800), curve: Curves.easeIn);
                  },
                  child: Text(
                    widget.txt,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                GestureDetector(
                    onTap: () async {
                      Navigator.of(context).push(PageRouteBuilder(
                          opaque: false,
                          pageBuilder: (BuildContext context, _, __) =>
                              PickeTemp(
                                temp: '',
                                list: <Widget>[
                                  txt('Tudo',
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold)),
                                  txt('Séries'),
                                  txt('Filmes'),
                                  txt('Minha lista'),
                                ],
                                callback: (s) {
                                  Navigator.of(context).pop();
                                },
                              )));
                    },
                    child: Icon(Icons.arrow_drop_down)),
                GestureDetector(
                  onTap: () async {
                    Navigator.of(context).push(PageRouteBuilder(
                        opaque: false,
                        pageBuilder: (BuildContext context, _, __) => PickeTemp(
                              temp: '',
                              list: <Widget>[
                                txt('Todos os gêneros',
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold)),
                                txt('Disponível para download'),
                                txt('Ação'),
                                txt('Anime'),
                                txt('Clássicos'),
                                txt('Comédia'),
                                txt('Comédia stand-up'),
                                txt('Documentários'),
                                txt('Drama'),
                                txt('Esportes'),
                                txt('Estrangeiros'),
                                txt('Fé e espiritualidade'),
                                txt('Ficção científica e fantasia'),
                                txt('Filmes brasileiros'),
                                txt('Hollywood'),
                                txt('Independentes'),
                                txt('LGBTQ'),
                                txt('Música e musicais'),
                                txt('Para a familia toda'),
                                txt('Policiais'),
                                txt('Premiados'),
                                txt('Romance'),
                                txt('Suspense'),
                                txt('Terror'),
                                txt('Descrição de áudio'),
                              ],
                              callback: (s) {
                                Navigator.of(context).pop();
                              },
                            )));
                  },
                  child: Text(
                    "Todos os gêneros",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Icon(Icons.arrow_drop_down),
              ],
            )
          : GestureDetector(
              onTap: () async {
                if (_controller.isCompleted) {
                  _controller.reset();
                  _controller.forward();
                } else {
                  _controller.forward();
                }
                widget.isAnimating(_controller);
                // controller.jumpTo(0);
                //  controller.nextPage(  duration: Duration(milliseconds: 800), curve: Curves.easeIn);
              },
              child: Text(
                widget.txt,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
    );
  }

  Widget txt(String s, {TextStyle style = const TextStyle(fontSize: 20)}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(child: new Text(s, style: style)),
    );
  }
}
