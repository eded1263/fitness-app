import 'package:flutter/material.dart';

import '../../models/goal.dart';

class GoalCard extends StatelessWidget {
  const GoalCard({super.key, required this.goal});
  final Goal goal;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.only(left: 5.0, right: 5, bottom: 20),
        decoration: _containerGradientDecoration(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.35,
                margin: const EdgeInsets.only(top: 20),
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Image.asset(goal.image, fit: BoxFit.fill),
              ),
              const SizedBox(height: 20),
              Text(
                goal.name,
                style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                overflow: TextOverflow.visible,
              ),
              Container(
                decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.white))),
                width: 50,
                clipBehavior: Clip.none,
                margin: const EdgeInsets.only(top: 5),
              ),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: Text(
                    goal.description,
                    style: const TextStyle(fontSize: 16.0, color: Colors.white),
                    textAlign: TextAlign.center,
                  )),
            ],
          ),
        ));
  }

  _containerGradientDecoration() {
    return BoxDecoration(
        boxShadow: const [
          BoxShadow(
              color: Color((0xff92A3FD)), offset: Offset(0, 2), blurRadius: 8.0)
        ],
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          stops: [0.0, 1.0],
          colors: [
            Color(0xff9DCEFF),
            Color(0xff92A3FD),
          ],
        ),
        borderRadius: BorderRadius.circular(20.0));
  }
}
