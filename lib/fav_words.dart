import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/favorite_words.dart';

class FavoriteWordsAdmin extends StatefulWidget {
  const FavoriteWordsAdmin({super.key, required this.favoriteWords});

  final FavoriteWords favoriteWords;

  @override
  State<FavoriteWordsAdmin> createState() => _FavoriteWordsAdminState();
}

class _FavoriteWordsAdminState extends State<FavoriteWordsAdmin> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(5),
        child: widget.favoriteWords.buildList(true));
  }
}
