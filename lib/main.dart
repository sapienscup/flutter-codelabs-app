import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

void main() {
  runApp(Ammah());
}

class Ammah extends StatelessWidget {
  const Ammah({super.key});

  @override
  Widget build(BuildContext context) {
    Intl.defaultLocale = 'pt_BR';

    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('pt'), // Brazil
          const Locale('en'), // English
          const Locale('es'), // Spanish
        ],
        title: 'Ammah',
        theme: ThemeData(
          fontFamily: 'Montserrat',
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.pink.shade400,
              background: Colors.pink.shade400,
              primary: Colors.pink.shade400),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

List<String> words = [
  "harshsearch",
  "smallride",
  "deadmatch",
  "strongpoll",
  "damnweight",
  "bigstream",
  "kindglance",
  "steaksouth",
  "harshtouch"
];

class MyAppState extends ChangeNotifier {
  var wordIndex = 1;
  var current = words.first;
  double _currentSliderValue = 20;
  DateTime start = DateTime.now();
  DateTime end = DateTime.now();
  var favorites = <String>[];

  void changeStateBasedOnDateClicked(var incDate, var endDate) {
    start = incDate;
    end = incDate;
    print("start: $start");
    print("end: $end");
    notifyListeners();
  }

  void getNext() {
    current = words[wordIndex % words.length];
    wordIndex += 1;
    notifyListeners();
  }

  void setSliderState(double value) {
    _currentSliderValue = value;
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
    notifyListeners();
  }
}

class MyHomePage extends StatelessWidget {
  void onChangedSlider(double value) {
    print(value);
  }

  void onDateChanged(DateTime dt) {
    print(dt.toString());
  }

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Scaffold(
        body: Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        decoration: womenDecorationBoxTop(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // MotivationalPhrase(),
            BigCard(appState: appState),
            RandomIdeiaGenerator(appState: appState),
            MenstrualCycleCalendar(appState: appState),
            // SelectMenstrualStrenghLevel(appState: appState),
          ],
        ),
      ),
    ));
  }

  BoxDecoration womenDecorationBoxTop() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(50),
      boxShadow: [
        BoxShadow(
          color: Colors.indigo.withOpacity(0.1),
          spreadRadius: 7,
          blurRadius: 10,
          offset: Offset(4, 4), // changes position of shadow
        ),
      ],
      image: DecorationImage(
          image: AssetImage("assets/women.png"),
          alignment: Alignment.topCenter),
    );
  }
}

class SelectMenstrualStrenghLevel extends StatelessWidget {
  const SelectMenstrualStrenghLevel({
    super.key,
    required this.appState,
  });

  final MyAppState appState;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, state) => Center(
          child: Column(
        children: [
          Text("Atualize ciclo menstrual"),
          Slider(
            value: appState._currentSliderValue,
            min: 0,
            max: 35,
            divisions: 35,
            label: appState._currentSliderValue.round().toString(),
            onChanged: (val) {
              state(() {
                appState._currentSliderValue = val;
              });
            },
          )
        ],
      )),
    );
  }
}

class MotivationalPhrase extends StatelessWidget {
  const MotivationalPhrase({
    super.key,
  });

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

class MenstrualCycleCalendar extends StatelessWidget {
  const MenstrualCycleCalendar({super.key, required this.appState});

  final MyAppState appState;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Card(
          elevation: 10,
          child: Localizations.override(
              context: context,
              locale: const Locale('pt'),
              // Using a Builder to get the correct BuildContext.
              // Alternatively, you can create a new widget and Localizations.override
              // will pass the updated BuildContext to the new widget.
              child: Builder(
                builder: (context) {
                  return SfDateRangePicker(
                    showTodayButton: true,
                    initialSelectedDates: [appState.start, appState.end],
                    minDate: DateTime(2023, 1, 1),
                    maxDate: DateTime.now().add(const Duration(days: 5000)),
                    selectionMode: DateRangePickerSelectionMode.range,
                    onSelectionChanged: (value) {
                      appState.changeStateBasedOnDateClicked(
                          value.value.startDate, value.value.endDate);
                    },
                  );
                },
              ))),
    );
  }
}

class RandomIdeiaGenerator extends StatelessWidget {
  const RandomIdeiaGenerator({
    super.key,
    required this.appState,
  });

  final MyAppState appState;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
            onPressed: () => {appState.toggleFavorite()},
            child: Row(
              children: [
                Icon(
                  appState.alreadyFavority()
                      ? Icons.favorite
                      : Icons.favorite_outline,
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
            appState.getNext();
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

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.appState,
  });

  final MyAppState appState;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Card(
            elevation: 9,
            color: theme.colorScheme.primary,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(appState.current, style: style),
            ))
      ],
    );
  }
}
