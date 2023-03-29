import 'package:flutter/material.dart';

enum Sex {
  masculine,
  feminine,
}

class SexSelected extends ValueNotifier<Sex?> {
  SexSelected() : super(null);

  void masculine() {
    value = Sex.masculine;
  }

  void feminine() {
    value = Sex.feminine;
  }
}
