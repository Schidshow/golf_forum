import 'package:flutter/material.dart';

class AppSpace {
  static double half = 8.0;
  static double space = 16.0;
  static double radius = 7.0;

  static EdgeInsets page =
      EdgeInsets.only(left: space, right: space, bottom: space);
  static Padding pagePadding = Padding(padding: page);

  static SizedBox spaceBox = SizedBox(
    width: space,
    height: space,
  );
}
