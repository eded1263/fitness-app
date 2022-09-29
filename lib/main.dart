import 'package:flutter/material.dart';
import 'package:fitness_app/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (context) => "Fitnest X",
      initialRoute: RouterGenerator.homePage,
      onGenerateRoute: RouterGenerator.generateRoute,
      debugShowCheckedModeBanner: false,
    );
    // return MaterialApp(
    //   title: 'Fitnest X',
    //   theme: ThemeData(
    //     primarySwatch: Colors.blue,
    //   ),
    //   home: const HomePage(),
    // );
  }
}
