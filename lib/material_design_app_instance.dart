import 'package:flutter/material.dart';
import 'package:flutter_application_1/my_home_app.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MaterialDesignAppInstance extends StatelessWidget {
  const MaterialDesignAppInstance({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('pt', 'BR'), // Brazil
        const Locale('en'), // English
        const Locale('es'), // Spanish
      ],
      localeListResolutionCallback: (locales, supportedLocales) =>
          const Locale('pt', 'BR'),
      title: 'Elden Ring Characters',
      theme: buildTheme(),
      home: MyHomeApp(),
    );
  }

  ThemeData buildTheme() {
    return ThemeData(
      fontFamily: 'Montserrat',
      useMaterial3: true,
      scrollbarTheme: ScrollbarThemeData().copyWith(
        thumbColor: MaterialStateProperty.all(Colors.pink.shade100),
      ),
      colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.yellow.shade800,
          background: Colors.yellow.shade800,
          primary: Colors.yellow.shade800),
    );
  }
}
