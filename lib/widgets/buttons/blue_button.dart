import 'package:flutter/material.dart';

class BlueButton extends StatelessWidget {
  const BlueButton({super.key, required this.onClick, required this.label});

  final Function() onClick;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: _containerDecoration(),
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
          // Colors.deepPurple.shade400,
          // Colors.deepPurple.shade200,
        ],
      ),
      color: const Color(0xff92A3FD),
      borderRadius: BorderRadius.circular(50),
    );
  }
}

// class RoundedButtonWidget extends StatelessWidget {
//   final String buttonText;
//   final double width;
//   final Function onpressed;

//   RoundedButtonWidget({
//     required this.buttonText,
//     required this.width,
//     required this.onpressed,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         decoration: BoxDecoration(
//           boxShadow: const [
//             BoxShadow(
//                 color: Colors.black26, offset: Offset(0, 4), blurRadius: 5.0)
//           ],
//           gradient: LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//             stops: const [0.0, 1.0],
//             colors: [
//               Colors.deepPurple.shade400,
//               Colors.deepPurple.shade200,
//             ],
//           ),
//           color: Colors.deepPurple.shade300,
//           borderRadius: BorderRadius.circular(20),
//         ),
//         child: ElevatedButton(
//           style: ButtonStyle(
//               shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                 RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(20.0),
//                 ),
//               ),
//               minimumSize: MaterialStateProperty.all(Size(width, 50)),
//               backgroundColor:
//                   MaterialStateProperty.all(Colors.transparent),
//               // elevation: MaterialStateProperty.all(3),
//               shadowColor:
//                   MaterialStateProperty.all(Colors.transparent),
//                   ),
//           onPressed: () {
//             onpressed();
//           },
//           child: Padding(
//             padding: const EdgeInsets.only(
//               top: 10,
//               bottom: 10,
//             ),
//             child: Text(
//               buttonText,
//               style: TextStyle(
//                 fontSize: 18,
//                 // fontWeight: FontWeight.w700,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//         ),
//       ),
//     ;
//   }
// }