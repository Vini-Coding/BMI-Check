import 'package:bmi_check/app/mobile/home/components/sex/enum/sex_enum.dart';
import 'package:flutter/material.dart';

class SexSelected extends ValueNotifier<Sex?> {
  SexSelected() : super(null);

  void masculine() {
    value = Sex.masculine;
  }

  void feminine() {
    value = Sex.feminine;
  }
}


