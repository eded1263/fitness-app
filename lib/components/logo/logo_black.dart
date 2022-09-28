import 'package:flutter/material.dart';

class LogoBlack extends StatelessWidget {
  const LogoBlack({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Text(
          "Fitnest",
          style: _getBlackPartStyle(),
          textAlign: TextAlign.center,
        ),
        Text("X", style: _getXPartStyle(), textAlign: TextAlign.center)
      ],
    );
  }

  TextStyle _getBlackPartStyle() {
    return const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 32,
    );
  }

  TextStyle _getXPartStyle() {
    return const TextStyle(
        color: Color(0xffC29DF1), fontWeight: FontWeight.bold, fontSize: 46);
  }
}
