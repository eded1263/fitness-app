import 'package:flutter/material.dart';

class CatchPhrase extends StatelessWidget {
  const CatchPhrase({super.key});

  @override
  Widget build(BuildContext context) {
    return Text("Everybody Can Train", style: _getTextStyle());
  }

  TextStyle _getTextStyle() {
    return const TextStyle(
        fontSize: 18, fontWeight: FontWeight.w300, color: Color(0xff7B6F72));
  }
}
