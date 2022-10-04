import 'dart:io';

import 'package:fitness_app/routes.dart';
import 'package:fitness_app/styles/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../cache/cache.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 50),
      child: Consumer<AppCache>(
          builder: (context, cache, child) => Column(children: [
                Row(
                  children: [
                    CircleAvatar(
                        child: Image.file(
                      File(cache.user.picture),
                      fit: BoxFit.fill,
                    )),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${cache.user.name} ${cache.user.surname}",
                            style: _getBoldTextStyle()),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(cache.user.goal.name, style: _getTextStyle())
                      ],
                    ),
                    Expanded(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          decoration: AppStyles.containerGradientDecoration(
                              roundBorder: true),
                          width: 75,
                          child: _mountButton(),
                        )
                      ],
                    ))
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width * 0.2,
                        decoration: _getContainerBoxDecoration(),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("${cache.user.height}cm",
                                style: _colorTextStyle()),
                            const Text(
                              "Height",
                              style: TextStyle(color: Colors.grey),
                            )
                          ],
                        )),
                    Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width * 0.2,
                        decoration: _getContainerBoxDecoration(),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("${cache.user.weight}kg",
                                style: _colorTextStyle()),
                            const Text(
                              "Height",
                              style: TextStyle(color: Colors.grey),
                            )
                          ],
                        )),
                    Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width * 0.2,
                        decoration: _getContainerBoxDecoration(),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("${_calcAge(cache.user.dateOfBirth)}yo",
                                style: _colorTextStyle()),
                            const Text(
                              "Height",
                              style: TextStyle(color: Colors.grey),
                            )
                          ],
                        )),
                  ],
                )
              ])),
    ));
  }

  final Shader linearGradient = const LinearGradient(
    colors: <Color>[Color(0xffDA44bb), Color(0xff8921aa)],
  ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  BoxDecoration _getContainerBoxDecoration() {
    return BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
              color: Colors.black26, offset: Offset(0, 4), blurRadius: 5.0)
        ]);
  }

  String _calcAge(String dob) {
    //TODO: calcular idade baseado no input
    return "22";
  }

  TextStyle _colorTextStyle() {
    return TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
      foreground: Paint()..shader = linearGradient,
    );
  }

  Widget _mountButton() {
    return TextButton(
        onPressed: () {},
        child: const Text(
          "Edit",
          style: TextStyle(color: Colors.white),
        ));
  }

  TextStyle _getBoldTextStyle() {
    return const TextStyle(color: Colors.black, fontWeight: FontWeight.bold);
  }

  TextStyle _getTextStyle() {
    return const TextStyle(
      color: Colors.grey,
    );
  }
}
