import 'package:flutter/material.dart';

class BlueButton extends StatelessWidget {
  const BlueButton(
      {super.key,
      required this.onClick,
      required this.label,
      this.buttonSize = 1});

  final Function() onClick;
  final String label;
  final double buttonSize;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: _containerDecoration(),
        width: MediaQuery.of(context).size.width * buttonSize,
        child: ElevatedButton(
          onPressed: onClick,
          style: _getStyle(),
          child: Text(label),
        ));
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

  BoxDecoration _containerDecoration() {
    return BoxDecoration(
      boxShadow: const [
        BoxShadow(color: Colors.black26, offset: Offset(0, 4), blurRadius: 5.0)
      ],
      gradient: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        stops: [0.0, 1.0],
        colors: [
          Color(0xff9DCEFF),
          Color(0xff92A3FD),
        ],
      ),
      color: const Color(0xff92A3FD),
      borderRadius: BorderRadius.circular(50),
    );
  }
}
