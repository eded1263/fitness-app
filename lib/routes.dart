import 'package:fitness_app/routes/goal_page.dart';
import 'package:fitness_app/routes/home_page.dart';
import 'package:fitness_app/routes/picture_page.dart';
import 'package:fitness_app/routes/profile_page.dart';
import 'package:fitness_app/routes/sign_in_page.dart';
import 'package:fitness_app/routes/user_form_page.dart';
import 'package:flutter/material.dart';

class RouterGenerator {
  static const String homePage = '/';
  static const String goalsPage = '/goals';
  static const String picturesPage = '/picture';
  static const String loginPage = '/login';
  static const String userFormPage = '/userForm';
  static const String profilePage = '/profile';

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
      case userFormPage:
        return MaterialPageRoute(
          builder: (_) => const UserFormPage(),
        );
      case profilePage:
        return MaterialPageRoute(
          builder: (_) => ProfilePage(),
        );
      default:
        throw const FormatException("Rota não encontrada");
    }
  }
}
