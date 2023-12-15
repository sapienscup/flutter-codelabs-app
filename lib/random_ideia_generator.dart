import 'package:flutter/material.dart';
import 'package:flutter_application_1/big_card.dart';
import 'package:english_words/english_words.dart';

class RandomIdeiaGenerator extends StatefulWidget {
  RandomIdeiaGenerator({super.key});

  @override
  State<RandomIdeiaGenerator> createState() => _RandomIdeiaGeneratorState();
}

class _RandomIdeiaGeneratorState extends State<RandomIdeiaGenerator> {
  List<WordPair> favorites = [];
  var current = WordPair.random();

  void getNext() {
    current = WordPair.random();
    print(current);
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

  refresh() {
    setState(() {
      print('oi');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BigCard(
              pair: current,
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () => {toggleFavorite()},
                child: Row(
                  children: [
                    Icon(
                      alreadyFavority()
                          ? Icons.favorite
                          : Icons.favorite_outline,
                      color: Colors.pink,
                      size: 24.0,
                      semanticLabel: 'Favoritar',
                    ),
                    SizedBox(width: 10),
                    Text("Gostei",
                        style: TextStyle(fontSize: 16, color: Colors.black))
                  ],
                )),
            SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {
                getNext();
              },
              child: Text(
                'Próxima',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
          ],
        )
      ],
    );
  }
}
