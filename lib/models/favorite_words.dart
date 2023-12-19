import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/fav_word_list_item.dart';
import 'package:flutter_application_1/models/base_model.dart';

class FavoriteWords extends BaseModel {
  List<FavoriteWordItem> ideas = [];
  WordPair current = WordPair.random();

  void getNext() {
    current = WordPair.random();

    ideas.add(FavoriteWordItem(current, false));
  }

  bool contains() {
    return ideas.contains(FavoriteWordItem(current, true));
  }

  ListView buildFavorites(bool showActions) {
    return ListView.builder(
      itemCount: ideas.length,
      itemBuilder: (context, index) {
        final item = ideas[index];
        if (item.isFavorite) {
          return ListTile(
            title: item.render(context, showActions),
          );
        }
      },
    );
  }

  ListView buildList(bool showActions) {
    return ListView.builder(
      itemCount: ideas.length,
      itemBuilder: (context, index) {
        final item = ideas[index];
        return ListTile(
          title: item.render(context, showActions),
        );
      },
    );
  }

  void removeFavorite() {
    var toBeRemoved = FavoriteWordItem(current, true);
    var foundItem;

    for (var item in ideas) {
      if (item.isEqual(toBeRemoved)) {
        foundItem = item;
      }
    }

    ideas.remove(foundItem);
  }

  void unFavorite() {
    var aux = FavoriteWordItem(current, true);
    for (var item in ideas) {
      if (item.isEqual(aux)) {
        item.setIsFavorite(false);
      }
    }
  }

  void toggleFavorite() {
    if (ideas.contains(FavoriteWordItem(current, true))) {
      unFavorite();
    } else {
      ideas.add(FavoriteWordItem(current, true));
    }
  }
}
