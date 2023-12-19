import 'package:flutter/material.dart';
import 'package:flutter_application_1/big_card.dart';
import 'package:flutter_application_1/models/favorite_words.dart';

class RandomIdeiaGenerator extends StatefulWidget {
  RandomIdeiaGenerator(
      {super.key, required this.favoriteWords, required this.notifyParent});

  final Function() notifyParent;
  final FavoriteWords favoriteWords;

  @override
  State<RandomIdeiaGenerator> createState() => _RandomIdeiaGeneratorState();
}

class _RandomIdeiaGeneratorState extends State<RandomIdeiaGenerator> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          return Row(
            children: <Widget>[
              SizedBox(
                  height: 200,
                  width: constraints.maxWidth,
                  child: Scrollbar(
                    radius: Radius.circular(20),
                    thickness: 5,
                    thumbVisibility: true,
                    child: widget.favoriteWords.buildIdeas(),
                  )),
            ],
          );
        }),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BigCard(
              pair: widget.favoriteWords.current,
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  widget.favoriteWords.toggleFavorite();
                  widget.notifyParent();
                },
                child: Row(
                  children: [
                    Icon(
                      widget.favoriteWords.contains()
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
                widget.favoriteWords.getNext();
                widget.notifyParent();
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
