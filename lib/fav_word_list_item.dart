import 'package:flutter/material.dart';

abstract class ListItem {
  Widget buildFavoriteWord(BuildContext context, bool showActions);

  bool isEqual(FavoriteWordItem toBeRemoved);

  void setIsFavorite(bool value);
}

class FavoriteWordItem implements ListItem {
  FavoriteWordItem(this.favoriteWord, this._isFavorite);

  bool _isFavorite;

  bool get isFavorite => _isFavorite;

  set isFavorite(bool value) {
    _isFavorite = value;
  }

  final String favoriteWord;

  @override
  bool isEqual(FavoriteWordItem other) {
    return favoriteWord == other.favoriteWord;
  }

  @override
  void setIsFavorite(bool value) {
    isFavorite = value;
  }

  @override
  Widget buildFavoriteWord(BuildContext context, bool showActions) {
    var components = [
      Icon(
        isFavorite ? Icons.favorite : Icons.favorite_outline,
        color: Colors.white,
        size: 14.0,
        semanticLabel: 'Favoritar',
      ),
      SizedBox(width: 5),
      Text(
        favoriteWord.toLowerCase(),
        style: TextStyle(color: Colors.white54, fontSize: 14),
      ),
    ];

    if (showActions) {
      components.addAll([
        SizedBox(width: 5),
        IconButton(
            onPressed: () => {},
            icon: Icon(
              Icons.delete,
              color: Colors.white,
              size: 14.0,
              semanticLabel: 'Favoritar',
            ))
      ]);
    }

    return Row(
      children: components,
    );
  }
}
