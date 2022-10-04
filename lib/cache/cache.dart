import 'dart:collection';

import 'package:fitness_app/models/goal.dart';
import 'package:fitness_app/models/user.dart';
import 'package:fitness_app/models/user_objective.dart';

class AppCache {
  int _objectiveIndex = -1;

  final List<UserObjective> _userObjectives = [];

  void addItem(String title, String descr, bool done) {
    _userObjectives.add(UserObjective(title, descr, done));
  }

  int get objectiveIndex => _objectiveIndex;

  set objectiveIndex(int value) {
    if ((value >= 0) && (value < _userObjectives.length)) {
      _objectiveIndex = value;
    } else {
      _objectiveIndex = -1;
    }
  }

  final List<Goal> _goals = [
    Goal(
        name: "Improve Shape",
        image: "assets/images/improve_shape.png",
        description:
            "I have a low amount of body fat and need / want to build more muscle"),
    Goal(
        name: "Lean & Tone",
        image: "assets/images/lean_tone.png",
        description:
            "I'm \"skinny fat\". Look thin but have no shape. I Want to add learn muscle in the right way"),
    Goal(
        name: "Lose a Fat",
        image: "assets/images/lose_fat.png",
        description:
            "I have over 20lbs to lose. I want to drop all this fat and gain muscle mass"),
  ];

  UnmodifiableListView<Goal> get goalTypes =>
      UnmodifiableListView<Goal>(_goals);

  UnmodifiableListView<UserObjective> get objectives =>
      UnmodifiableListView<UserObjective>(_userObjectives);

  User _user = User("", "");

  void setUser(String name, String surname) {
    _user = User(name, surname);
  }

  void updateUserPicture(String picture) {
    _user.picture = picture;
  }

  void setUserGoal(Goal goal) {
    _user.goal = goal;
  }

  void updateUserName(String name, String surname) {
    _user.name = name != "" ? name : _user.name;
    _user.surname = surname != "" ? surname : _user.surname;
  }

  User get user => _user;
}
