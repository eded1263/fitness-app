import 'package:fitness_app/styles/app_styles.dart';
import 'package:flutter/material.dart';

class BlueButton extends StatelessWidget {
  BlueButton(
      {super.key,
      required this.onClick,
      required this.label,
      this.icon,
      this.buttonSize = 1});

  final Function() onClick;
  final String label;
  final double buttonSize;
  IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: AppStyles.containerGradientDecoration(shadows: [
          const BoxShadow(
              color: Colors.black26, offset: Offset(0, 4), blurRadius: 5.0)
        ]),
        width: MediaQuery.of(context).size.width * buttonSize,
        child: ElevatedButton(
            onPressed: onClick, style: _getStyle(), child: _buildContent()));
  }

  _buildContent() {
    if (icon != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.login),
          const SizedBox(width: 10),
          Text(label),
        ],
      );
    }
    return Text(label);
  }

  ButtonStyle _getStyle() {
    return ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      minimumSize: MaterialStateProperty.all(const Size(50, 60)),
      backgroundColor: MaterialStateProperty.all(Colors.transparent),
      shadowColor: MaterialStateProperty.all(Colors.transparent),
    );
  }
}
