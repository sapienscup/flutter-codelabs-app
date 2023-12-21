import 'package:flutter/material.dart';
import 'package:flutter_application_1/bosses_card.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/fav_words.dart';
import 'package:flutter_application_1/models/favorite_words.dart';
import 'package:flutter_application_1/random_ideia_generator.dart';

class TheHomeApp extends StatefulWidget {
  const TheHomeApp({super.key});

  @override
  State<TheHomeApp> createState() => _MyHomeApp();
}

class _MyHomeApp extends State<TheHomeApp> {
  var selectedIndex = 0;
  FavoriteWords favoriteWords = FavoriteWords();

  refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Widget page;

    switch (selectedIndex) {
      case 0:
        page = RandomIdeiaGenerator(
            favoriteWords: favoriteWords, notifyParent: refresh);
        break;
      case 1:
        page = FavoriteWordsAdmin(favoriteWords: favoriteWords);
        break;
      case 2:
        page = BossesDisplayList();
        break;
      case 3:
        page = Placeholder(
          color: Colors.blueAccent,
        );
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
          body: page,
          drawer: SafeArea(
              bottom: true,
              right: true,
              child: Row(
                children: [
                  NavigationRail(
                    groupAlignment: 1,
                    elevation: Constants.elevation,
                    extended: constraints.maxWidth >= 600,
                    destinations: [
                      NavigationRailDestination(
                        icon: Icon(Icons.read_more),
                        label: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 24),
                          child: RotatedBox(
                            quarterTurns: -1,
                            child: Text("Ideias"),
                          ),
                        ),
                      ),
                      NavigationRailDestination(
                          icon: Icon(Icons.ac_unit_outlined),
                          label: Text("Favorites")),
                      NavigationRailDestination(
                          icon: Icon(Icons.access_time_outlined),
                          label: Text("Período")),
                      NavigationRailDestination(
                          icon: Icon(Icons.settings), label: Text("Configs")),
                    ],
                    selectedIndex: selectedIndex,
                    onDestinationSelected: (int index) {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                  ),
                  Expanded(
                      child: Container(
                    decoration: womanAppModelDecorativeBackground(),
                  )),
                ],
              )));
    });
  }

  BoxDecoration womanAppModelDecorativeBackground() {
    return BoxDecoration(
      image: DecorationImage(
          image: AssetImage("assets/casting.gif"),
          opacity: 0.7,
          alignment: Alignment.bottomRight),
    );
  }
}
