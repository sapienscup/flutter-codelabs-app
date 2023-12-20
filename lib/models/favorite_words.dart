import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/fav_word_list_item.dart';
import 'package:flutter_application_1/models/base_model.dart';

class FavoriteWords extends BaseModel {
  List<FavoriteWordItem> ideas = [];
  Map<String, FavoriteWordItem> favorites = {};
  WordPair current = WordPair.random();

  void getNext() {
    current = WordPair.random();

    ideas.add(FavoriteWordItem(current, false));
  }

  bool contains() {
    return ideas.contains(FavoriteWordItem(current, true));
  }

  ListView buildFavorites() {
    return ListView.builder(
      itemCount: favorites.length,
      itemBuilder: (context, index) {
        final item = favorites[index];
        return ListTile(
          title: item?.renderAdmin(context),
        );
      },
    );
  }

  ListView buildIdeas() {
    return ListView.builder(
      itemCount: ideas.length,
      itemBuilder: (context, index) {
        final item = ideas[index];
        return ListTile(
          title: item.render(context),
        );
      },
    );
  }

  void unfavorite() {
    var aux = FavoriteWordItem(current, true);
    for (var item in ideas) {
      if (item == aux) {
        item.setIsFavorite(false);
      }
    }
  }

  void favorite() {
    var aux = FavoriteWordItem(current, false);
    for (var item in ideas) {
      if (item == aux) {
        item.setIsFavorite(true);
      }
    }

    favorites["${current.first}.${current.second}"] =
        FavoriteWordItem(current, true);
  }

  void toggleFavorite() {
    if (ideas.isEmpty) {
      ideas.add(FavoriteWordItem(current, true));
      return;
    }

    if (ideas.contains(FavoriteWordItem(current, true))) {
      unfavorite();
    } else {
      favorite();
    }
  }
}
