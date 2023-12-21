import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/base_model.dart';

class Account extends BaseModel {
  @required
  late String email;
  @required
  late String password;
}
