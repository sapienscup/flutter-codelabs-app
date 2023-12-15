import 'package:flutter/material.dart';

class SelectMenstrualStrenghLevel extends StatefulWidget {
  SelectMenstrualStrenghLevel({super.key, required this.currentSliderValue});

  double currentSliderValue;

  @override
  State<SelectMenstrualStrenghLevel> createState() =>
      _SelectMenstrualStrenghLevelState();
}

class _SelectMenstrualStrenghLevelState
    extends State<SelectMenstrualStrenghLevel> {
  void setSliderState(double value) {
    widget.currentSliderValue = value;
  }

  void onChangedSlider(double value) {
    print(value);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Atualize ciclo menstrual"),
        Slider(
          value: widget.currentSliderValue,
          min: 0,
          max: 35,
          divisions: 35,
          label: widget.currentSliderValue.round().toString(),
          onChanged: (val) {
            widget.currentSliderValue = val;
          },
        )
      ],
    );
  }
}
