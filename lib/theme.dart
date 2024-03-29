import 'package:flutter/material.dart';

import 'constants.dart';
import 'helpers/custom_transition.dart';

ThemeData theme() {
  return ThemeData(
    pageTransitionsTheme: PageTransitionsTheme(
        builders: {TargetPlatform.android: CustomPageTransitionBuilder()}),
    scaffoldBackgroundColor: Colors.white,
    fontFamily: "Muli",
    primaryColor: kPrimaryColor,
    accentColor: kPrimaryLightColor,
    appBarTheme: appBarTheme(),
    textTheme: textTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

TextTheme textTheme() {
  return TextTheme(
    bodyText1: TextStyle(color: kTextColor),
    bodyText2: TextStyle(color: kTextColor),
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    color: Colors.white,
    elevation: 0,
    brightness: Brightness.light,
    iconTheme: IconThemeData(color: Colors.black),
    textTheme: TextTheme(
      headline6: TextStyle(
        color: Color(0XFF8B8b8b),
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
