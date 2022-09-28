import 'package:flutter/material.dart';

import '../components/buttons/blue_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [Text("FitnestX"), Text("Everybody Can Train")],
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
        ));
  }

  onClickButton() {
    print("Fui clicado");
  }
}
