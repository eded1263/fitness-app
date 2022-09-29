import 'package:fitness_app/routes/home_page.dart';
import 'package:flutter/material.dart';

class RouterGenerator {
  static const String homePage = '/';
  RouterGenerator._();
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePage:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
      // EXEMPLO: Para o form de cadastro
      // case cadastro:
      //   return MaterialPageRoute(
      //     builder: (_) => const FormCadastro(),
      //   );

      default:
        throw const FormatException("Rota não encontrada");
    }
  }
}
