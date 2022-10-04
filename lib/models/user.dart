import 'package:fitness_app/models/goal.dart';

class User {
  String name;
  String surname;
  String picture = "";
  String email = "";
  String gender = "";
  String height = "";
  String weight = "";
  String dateOfBirth = "";
  late Goal goal = Goal(
      name: "Improve Shape",
      image: "assets/images/improve_shape.png",
      description:
          "I have a low amount of body fat and need / want to build more muscle");
  User(this.name, this.surname);
}
