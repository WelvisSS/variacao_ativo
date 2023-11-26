import 'package:flutter/material.dart';

class ColorsApp {
  static ColorsApp? _instance;

  ColorsApp._();

  static ColorsApp get i {
    _instance ??= ColorsApp._();
    return _instance!;
  }

  // Color get primary => const Color(0xFF004D74);
  // Color get secundary => const Color(0xFF006DA4);
  // Color get backgroundColor => const Color(0xFF032030);

  Color get primary => const Color(0xFF30C86D);
  Color get secundary => const Color(0xFF001711);
  Color get backgroundColor => const Color(0xFF00120E);

  Color get candleNegativeColor => const Color(0xFFFF0000);
  Color get candlePositiveColor => const Color(0xFF00FE21);

  // Color get primary => const Color(0xFF462869);
  // Color get secundary => const Color(0xFF6E3FA2);
  // Color get backgroundColor => const Color(0xFF0C0F17);
}

extension ColorsAppExtension on BuildContext {
  ColorsApp get colors => ColorsApp.i;
}
