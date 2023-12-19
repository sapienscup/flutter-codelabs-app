import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class FavoriteWordItem {
  FavoriteWordItem(this.favoriteWord, this.isFavorite);

  bool isFavorite;

  final WordPair favoriteWord;

  void setIsFavorite(bool value) {
    isFavorite = value;
  }

  Widget renderAdmin(BuildContext context) {
    var icon = Icon(
      Icons.favorite,
      color: Colors.white,
      size: 14.0,
      semanticLabel: 'Favoritar',
    );

    var components = <Widget>[
      Container(
          width: 200,
          child: Row(children: [
            icon,
            SizedBox(
              width: 15,
            ),
            Text(
              "${favoriteWord.first.toLowerCase()} ${favoriteWord.second.toLowerCase()}",
              style: TextStyle(color: Colors.lime, fontSize: 14),
            ),
          ])),
      IconButton(
          onPressed: () => {},
          icon: Icon(
            Icons.delete,
            color: Colors.white,
            size: 14.0,
            semanticLabel: 'Favoritar',
          ))
    ];

    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround, children: components);
  }

  Widget render(BuildContext context) {
    var icon = Icon(
      Icons.favorite,
      color: Colors.white,
      size: 14.0,
      semanticLabel: 'Favoritar',
    );

    var components = <Widget>[];

    if (isFavorite) {
      components.addAll([
        icon,
        SizedBox(width: 5),
      ]);
    }

    components.addAll([
      Text(
        "${favoriteWord.first.toLowerCase()} ${favoriteWord.second.toLowerCase()}",
        style: TextStyle(color: Colors.lime, fontSize: 14),
      ),
    ]);

    return Row(
      children: components,
    );
  }

  @override
  bool operator ==(Object other) {
    if (other is FavoriteWordItem) {
      return (favoriteWord == other.favoriteWord) &&
          (isFavorite == other.isFavorite);
    } else {
      return false;
    }
  }

  @override
  int get hashCode => (favoriteWord.first.hashCode.toString() +
          favoriteWord.hashCode.toString() +
          isFavorite.toString())
      .hashCode;
}
