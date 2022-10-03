import 'package:fitness_app/routes/goal_page.dart';
import 'package:fitness_app/routes/home_page.dart';
import 'package:flutter/material.dart';

class RouterGenerator {
  static const String homePage = '/';
  static const String goalsPage = '/goals';
  RouterGenerator._();
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePage:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
      case goalsPage:
        return MaterialPageRoute(
          builder: (_) => const GoalsPage(),
        );

      default:
        throw const FormatException("Rota não encontrada");
    }
  }
}
