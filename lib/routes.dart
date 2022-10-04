import 'package:fitness_app/routes/goal_page.dart';
import 'package:fitness_app/routes/home_page.dart';
import 'package:fitness_app/routes/picture_page.dart';
import 'package:fitness_app/routes/sign_in_page.dart';
import 'package:flutter/material.dart';

class RouterGenerator {
  static const String homePage = '/';
  static const String goalsPage = '/goals';
  static const String picturesPage = '/picture';
  static const String loginPage = '/login';

  RouterGenerator._();
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePage:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
      case loginPage:
        return MaterialPageRoute(
          builder: (_) => const SignInTen(),
        );
      case goalsPage:
        return MaterialPageRoute(
          builder: (_) => const GoalsPage(),
        );
      case picturesPage:
        return MaterialPageRoute(
          builder: (_) => const PicturePage(),
        );

      default:
        throw const FormatException("Rota não encontrada");
    }
  }
}
