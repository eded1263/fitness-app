import 'package:fitness_app/models/goal.dart';

class User {
  String name;
  String surname;
  String picture = "";
  String email = "";
  late Goal goal;
  User(this.name, this.surname);
}
