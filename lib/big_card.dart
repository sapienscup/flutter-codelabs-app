import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_application_1/constants.dart';

class BigCard extends StatelessWidget {
  BigCard({
    super.key,
    required this.pair,
  });

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style1 = theme.textTheme.displaySmall!.copyWith(
      fontSize: 8,
      color: theme.colorScheme.onPrimary,
    );
    final style2 = theme.textTheme.displayMedium!.copyWith(
      fontWeight: FontWeight.bold,
      fontSize: 8,
      color: theme.colorScheme.onPrimary,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Card(
            elevation: Constants.elevation,
            color: theme.colorScheme.primary,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
              child: Column(children: [
                Text(
                  pair.first.toLowerCase(),
                  style: style1,
                  semanticsLabel: "${pair.first} ${pair.second.toUpperCase()}",
                ),
                Text(
                  pair.second.toUpperCase(),
                  style: style2,
                  semanticsLabel: "${pair.first} ${pair.second.toUpperCase()}",
                )
              ]),
            ))
      ],
    );
  }
}
