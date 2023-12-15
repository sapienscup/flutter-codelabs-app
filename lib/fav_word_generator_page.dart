import 'package:flutter/material.dart';
import 'package:flutter_application_1/big_card.dart';
import 'package:english_words/english_words.dart';

class FavWordGeneratorPage extends StatefulWidget {
  @override
  State<FavWordGeneratorPage> createState() => _FavWordGeneratorPageState();
}

class _FavWordGeneratorPageState extends State<FavWordGeneratorPage> {
  List<WordPair> favorites = [];
  var current = WordPair.random();

  void getNext() {
    current = WordPair.random();
  }

  bool alreadyFavority() {
    return favorites.contains(current);
  }

  void toggleFavorite() {
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
  }

  @override
  Widget build(BuildContext context) {
    IconData icon;
    if (favorites.contains(current)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BigCard(pair: current),
          SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  toggleFavorite();
                },
                icon: Icon(icon),
                label: Text('Gostei'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  getNext();
                },
                child: Text('Próxima'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
