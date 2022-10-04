import 'package:flutter/material.dart';

class AppStyles {
  static TextStyle titleStyle =
      const TextStyle(fontSize: 26, fontWeight: FontWeight.bold);

  static TextStyle basicTextStyle = const TextStyle(
      fontSize: 18, fontWeight: FontWeight.w300, color: Color(0xff7B6F72));

  static BoxDecoration containerGradientDecoration(
      {List<BoxShadow> shadows = const [], bool roundBorder = true}) {
    return BoxDecoration(
      boxShadow: shadows,
      gradient: const LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        stops: [0.0, 1.0],
        colors: [
          Color(0xff9DCEFF),
          Color(0xff92A3FD),
        ],
      ),
      color: const Color(0xff92A3FD),
      borderRadius: roundBorder
          ? BorderRadius.circular(50)
          : const BorderRadius.all(Radius.zero),
    );
  }
}
