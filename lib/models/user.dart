import 'package:fitness_app/models/goal.dart';

class User {
  String name;
  String surname;
  String picture = "";
  late Goal goal;
  User(this.name, this.surname);
}
