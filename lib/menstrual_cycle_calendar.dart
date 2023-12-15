import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class MenstrualCycleCalendar extends StatefulWidget {
  const MenstrualCycleCalendar({super.key});

  @override
  State<MenstrualCycleCalendar> createState() => _MenstrualCycleCalendarState();
}

class _MenstrualCycleCalendarState extends State<MenstrualCycleCalendar> {
  DateTime start = DateTime.now();
  DateTime end = DateTime.now();

  void changeStateBasedOnDateClicked(var incDate, var endDate) {
    start = incDate;
    end = incDate;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 1, right: 1),
          child: Card(
              elevation: Constants.elevation,
              child: Localizations.override(
                  context: context,
                  locale: const Locale('pt', 'BR'),
                  child: Builder(
                    builder: (context) {
                      return Column(
                        children: [
                          Text("Seu ciclo menstrual",
                              style: TextStyle(color: Colors.black38)),
                          SfDateRangePicker(
                            showTodayButton: true,
                            initialSelectedDates: [start, end],
                            minDate: DateTime(2023, 1, 1),
                            maxDate:
                                DateTime.now().add(const Duration(days: 5000)),
                            selectionMode: DateRangePickerSelectionMode.range,
                            onSelectionChanged: (value) {
                              changeStateBasedOnDateClicked(
                                  value.value.startDate, value.value.endDate);
                            },
                          ),
                        ],
                      );
                    },
                  ))),
        ),
      ],
    );
  }
}
