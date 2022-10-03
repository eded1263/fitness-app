import 'package:fitness_app/styles/app_styles.dart';
import 'package:flutter/material.dart';

class CatchPhrase extends StatelessWidget {
  const CatchPhrase({super.key});

  @override
  Widget build(BuildContext context) {
    return Text("Everybody Can Train", style: AppStyles.basicTextStyle);
  }
}
