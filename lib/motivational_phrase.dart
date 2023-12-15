import 'package:flutter/material.dart';

class MotivationalPhrase extends StatefulWidget {
  const MotivationalPhrase({
    super.key,
  });

  @override
  State<MotivationalPhrase> createState() => _MotivationalPhraseState();
}

class _MotivationalPhraseState extends State<MotivationalPhrase> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(5),
        child: Text(
          'Você é uma pessoa incrível',
          style: TextStyle(fontSize: 22, color: Colors.white),
        ));
  }
}
