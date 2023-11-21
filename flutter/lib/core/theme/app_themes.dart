import 'package:flutter/material.dart';

import 'app_colors.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: ColorsApp.i.backgroundColor,
    fontFamily: 'Mult',
    appBarTheme: appBarTheme(),
    textTheme: textTheme(),
    elevatedButtonTheme: elevatedButtonThemeData(),
    floatingActionButtonTheme: floatingActionButtonThemeData(),
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    backgroundColor: ColorsApp.i.primary,
    titleTextStyle: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      fontFamily: 'BwModelica',
    ),
  );
}

TextTheme textTheme() {
  return const TextTheme(
    bodyText2: TextStyle(fontFamily: 'BwModelica'),
    headline4: TextStyle(fontFamily: 'BwModelica'),
  );
}

ElevatedButtonThemeData elevatedButtonThemeData() {
  return ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(ColorsApp.i.primary),
    ),
  );
}

FloatingActionButtonThemeData floatingActionButtonThemeData() {
  return FloatingActionButtonThemeData(
    backgroundColor: ColorsApp.i.primary,
  );
}
