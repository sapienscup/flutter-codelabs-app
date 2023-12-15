import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/fav_word_generator_page.dart';
import 'package:flutter_application_1/menstrual_cycle_calendar.dart';
import 'package:flutter_application_1/my_app_state.dart';
import 'package:flutter_application_1/random_ideia_generator.dart';

class MyHomeApp extends StatefulWidget {
  const MyHomeApp({super.key});

  @override
  State<MyHomeApp> createState() => _MyHomeApp();
}

class _MyHomeApp extends State<MyHomeApp> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;

    switch (selectedIndex) {
      case 0:
        page = RandomIdeiaGenerator();
        break;
      case 1:
        page = MenstrualCycleCalendar();
        break;
      case 2:
        page = Placeholder(
          color: Colors.amber,
        );
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
          body: SafeArea(
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
                          icon: Icon(Icons.bloodtype), label: Text("Período")),
                      NavigationRailDestination(
                          icon: Icon(Icons.settings), label: Text("Configs")),
                      NavigationRailDestination(
                          icon: Icon(Icons.connect_without_contact),
                          label: Text("Conexões"))
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
                    decoration: womenDecorationBoxTop(),
                    child: page,
                  ))
                ],
              )));
    });
  }

  BoxDecoration womenDecorationBoxTop() {
    return BoxDecoration(
      image: DecorationImage(
          image: AssetImage("assets/woman-1-small.png"),
          opacity: 0.7,
          alignment: Alignment.bottomRight),
    );
  }
}
