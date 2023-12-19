import 'package:flutter/material.dart';
import 'package:flutter_application_1/material_design_app_instance.dart';
import 'package:flutter_application_1/my_app_state.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(Ammah());
}

class Ammah extends StatelessWidget {
  const Ammah({super.key});

  @override
  Widget build(BuildContext context) {
    Intl.defaultLocale = 'pt_BR';

    return MainApp();
  }
}

class MainApp extends StatelessWidget {
  const MainApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => LocaleState(),
        child: Consumer<LocaleState>(builder: (context, localeProvider, child) {
          return MaterialDesignAppInstance();
        }));
  }
}
