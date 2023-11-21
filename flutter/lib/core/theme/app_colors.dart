import 'package:flutter/material.dart';

class ColorsApp {
  static ColorsApp? _instance;

  ColorsApp._();

  static ColorsApp get i {
    _instance ??= ColorsApp._();
    return _instance!;
  }

  Color get primary => const Color(0xFF462869);
  Color get secundary => const Color(0xFF6E3FA2);
  Color get black => const Color(0xF0000000);
  Color get white => const Color(0xFFFFFFFF);
  Color get grey => const Color(0xFF616161);
  Color get textButtomColor => const Color(0xFFFFFFFF);
  Color get backgroundColor => const Color(0xFF0C0F17);
  Color get appBarTextStyleColor => const Color(0xFFFFFFFF);
  Color get errorStyleColor => const Color(0xFFFF0000);
  Color get textInputStyleColor => const Color(0xF0000000);
  Color get hinteTextStyleColor => const Color(0x877C7A7A);
  Color get fillStyleColor => const Color(0xFFEAEBEC);
  Color get textFormFieldStyleColor => const Color(0xF0000000);
  Color get prefixIconStyleColor => const Color(0x877C7A7A);
  Color get sufixIconStyleColor => const Color(0x877C7A7A);
  Color get mandatoryIndicatorStyleColor => const Color(0xFFFF0000); //"*" input
  Color get iconStyleColor => const Color(0xFFFFFFFF);
  Color get iconMenuStyleColor => const Color(0xF0000000);
  Color get tutorialBackground => const Color(0xFFDAE8F3);
  Color get cardPatientStyleColor => const Color(0XFFDADADA);
}

extension ColorsAppExtension on BuildContext {
  ColorsApp get colors => ColorsApp.i;
}
