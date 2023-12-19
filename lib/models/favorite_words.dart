import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/fav_word_list_item.dart';
import 'package:flutter_application_1/models/base_model.dart';

class FavoriteWords extends BaseModel {
  List<WordPair> wordsGenerated = [];
  List<WordPair> favorites = [];
  WordPair current = WordPair.random();
  List<ListItem> items = [];

  void getNext() {
    current = WordPair.random();

    wordsGenerated.add(current);
    items.add(FavoriteWordItem(
        '${current.first} ${current.second.toUpperCase()}', false));
  }

  bool contains() {
    return favorites.contains(current);
  }

  bool alreadyFavorite() {
    return favorites.contains(current);
  }

  ListView buildList(bool showActions) {
    return ListView.builder(
      // Let the ListView know how many items it needs to build.
      itemCount: items.length,
      // Provide a builder function. This is where the magic happens.
      // Convert each item into a widget based on the type of item it is.
      itemBuilder: (context, index) {
        final item = items[index];

        return ListTile(
          title: item.buildFavoriteWord(context, showActions),
        );
      },
    );
  }

  void removeFavorite() {
    favorites.remove(current);

    var toBeRemoved = FavoriteWordItem(
        '${current.first} ${current.second.toUpperCase()}', true);
    var foundItem;

    for (var item in items) {
      if (item.isEqual(toBeRemoved)) {
        foundItem = item;
      }
    }
    items.remove(foundItem);
  }

  void unFavorite() {
    var toBeRemoved = FavoriteWordItem(
        '${current.first} ${current.second.toUpperCase()}', true);
    for (var item in items) {
      if (item.isEqual(toBeRemoved)) {
        item.setIsFavorite(false);
      }
    }
  }

  void toggleFavorite() {
    if (favorites.contains(current)) {
      favorites.remove(current);
      unFavorite();
    } else {
      favorites.add(current);
      items.add(FavoriteWordItem(
          '${current.first} ${current.second.toUpperCase()}', true));
    }
  }
}
