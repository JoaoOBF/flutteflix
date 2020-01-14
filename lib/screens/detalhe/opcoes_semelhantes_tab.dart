import 'package:flutter/material.dart';

class OpcoesSemelhantesTab extends StatelessWidget {
  List<String> fts = [
    'https://img.elo7.com.br/product/main/23646C7/big-poster-filme-capita-marvel-tamanho-90x60-cm-presente-geek.jpg',
    'https://img.elo7.com.br/product/zoom/2364615/big-poster-filme-aquaman-2019-tamanho-90x60-cm-loot-op-001-geek.jpg',
    'https://img.elo7.com.br/product/zoom/25E7D76/big-poster-filme-vingadores-ultimato-lo003-tamanho-90x60-cm-presente-nerd.jpg',
    'https://uauposters.com.br/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/2/0/201906131155-uau-posters-filmes-godzilla-king-of-the-monsters.jpg',
    'https://img.elo7.com.br/product/main/23646C7/big-poster-filme-capita-marvel-tamanho-90x60-cm-presente-geek.jpg',
    'https://img.elo7.com.br/product/zoom/2364615/big-poster-filme-aquaman-2019-tamanho-90x60-cm-loot-op-001-geek.jpg',
    'https://img.elo7.com.br/product/zoom/25E7D76/big-poster-filme-vingadores-ultimato-lo003-tamanho-90x60-cm-presente-nerd.jpg',
    'https://img.elo7.com.br/product/zoom/25E7D76/big-poster-filme-vingadores-ultimato-lo003-tamanho-90x60-cm-presente-nerd.jpg',
    'https://uauposters.com.br/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/2/0/201906131155-uau-posters-filmes-godzilla-king-of-the-monsters.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return new GridView.builder(
        itemCount: fts.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (BuildContext context, int index) {
          return _foto(fts[index]);
        });
  }

  _foto(String url) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      width: 80,
      height: 80,
      child: Image.network(
        url,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
