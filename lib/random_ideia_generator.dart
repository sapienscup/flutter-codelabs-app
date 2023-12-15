import 'package:flutter/material.dart';
import 'package:flutter_application_1/big_card.dart';
import 'package:english_words/english_words.dart';

class RandomIdeiaGenerator extends StatefulWidget {
  const RandomIdeiaGenerator({
    super.key,
  });

  @override
  State<RandomIdeiaGenerator> createState() => _RandomIdeiaGeneratorState();
}

class _RandomIdeiaGeneratorState extends State<RandomIdeiaGenerator> {
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        BigCard(
          pair: current,
        ),
        ElevatedButton(
            onPressed: () => {toggleFavorite()},
            child: Row(
              children: [
                Icon(
                  alreadyFavority() ? Icons.favorite : Icons.favorite_outline,
                  color: Colors.pink,
                  size: 24.0,
                  semanticLabel: 'Favoritar',
                ),
                SizedBox(width: 10),
                Text("Gostar")
              ],
            )),
        ElevatedButton(
          onPressed: () {
            getNext();
          },
          child: Text(
            'Ideia',
            style: TextStyle(fontSize: 22, color: Colors.black),
          ),
        ),
      ],
    );
  }
}
