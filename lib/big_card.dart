import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_application_1/constants.dart';

class BigCard extends StatefulWidget {
  BigCard({
    super.key,
    required this.pair,
  });

  WordPair pair;

  @override
  State<BigCard> createState() => _BigCardState();
}

class _BigCardState extends State<BigCard> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!.copyWith(
      fontSize: 28,
      color: theme.colorScheme.onPrimary,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Card(
            elevation: Constants.elevation,
            color: theme.colorScheme.primary,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(widget.pair.asCamelCase, style: style),
            ))
      ],
    );
  }
}
