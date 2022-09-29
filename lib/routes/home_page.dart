import 'package:fitness_app/widgets/buttons/catch_phrase.dart';
import 'package:fitness_app/widgets/logo/logo_black.dart';
import 'package:flutter/material.dart';

import '../widgets/buttons/blue_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: Container(
            color: Colors.white,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [LogoBlack(), CatchPhrase()],
                ),
                Positioned(
                    bottom: 25,
                    left: 25,
                    right: 25,
                    child: BlueButton(
                      label: "Get Started",
                      onClick: onClickButton,
                    ))
              ],
            )));
  }

  onClickButton() {
    print("Fui clicado");
  }
}
