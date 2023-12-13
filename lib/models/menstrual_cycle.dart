import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/base_model.dart';

class MenstrualCycle extends BaseModel {
  @required
  late DateTime beginMenstrualCycle;
  @required
  late DateTime endMenstrualCycle;
  @required
  late DateTime beginOvulateCycle;
  @required
  late DateTime endOvulateCycle;
  @required
  late DateTime beginSyndromeCycle;
  @required
  late DateTime endSyndromeCycle;
}
