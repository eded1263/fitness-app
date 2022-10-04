import 'package:fitness_app/cache/cache.dart';
import 'package:fitness_app/widgets/buttons/blue_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserFormPage extends StatefulWidget {
  const UserFormPage({super.key});

  @override
  State<UserFormPage> createState() => _UserFormPageState();
}

class _UserFormPageState extends State<UserFormPage> {
  final List<String> _genders = ["Male", "Female", "Neutral", "Other"];
  String? _selectedGender = "Male";

  final TextEditingController _dateOfBirthController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 25),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/images/woman.png',
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text.rich(
                    TextSpan(
                        text: "Let's complete your profile",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        )),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text.rich(
                    TextSpan(
                        text: "It will help us to know more about you!",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              padding: const EdgeInsets.all(25),
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color.fromARGB(255, 239, 242, 243),
                          prefixIcon: const Icon(Icons.people_outline,
                              color: Color.fromARGB(255, 141, 140, 140)),
                          hintText: 'Choose Gender',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none)),
                      value: _selectedGender,
                      items: _genders
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(item,
                                    style: const TextStyle(
                                        fontSize: 15, color: Colors.black)),
                              ))
                          .toList(),
                      onChanged: (item) =>
                          setState(() => _selectedGender = item),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        TextField(
                          controller: _dateOfBirthController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color.fromARGB(255, 239, 242, 243),
                            labelText: "Date of Birth",
                            labelStyle: const TextStyle(
                              color: Color.fromARGB(255, 141, 140, 140),
                            ),
                            prefixIcon: const Icon(Icons.today,
                                color: Color.fromARGB(255, 141, 140, 140)),
                            border: myinputborder(),
                            enabledBorder: myinputborder(),
                            focusedBorder: myfocusborder(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.bottomLeft,
                    color: Colors.white,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: TextField(
                            controller: _weightController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor:
                                  const Color.fromARGB(255, 239, 242, 243),
                              labelText: "Your Weight",
                              labelStyle: const TextStyle(
                                color: Color.fromARGB(255, 141, 140, 140),
                              ),
                              prefixIcon: const Icon(Icons.scale,
                                  color: Color.fromARGB(255, 141, 140, 140)),
                              border: myinputborder(),
                              enabledBorder: myinputborder(),
                              focusedBorder: myfocusborder(),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        _measureBox("KG")
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.bottomLeft,
                    color: Colors.white,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: TextField(
                          controller: _heightController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color.fromARGB(255, 239, 242, 243),
                            labelText: "Your Height",
                            labelStyle: const TextStyle(
                              color: Color.fromARGB(255, 141, 140, 140),
                            ),
                            prefixIcon: const Icon(Icons.swap_vert,
                                color: Color.fromARGB(255, 141, 140, 140)),
                            border: myinputborder(),
                            enabledBorder: myinputborder(),
                            focusedBorder: myfocusborder(),
                          ),
                        )),
                        const SizedBox(
                          width: 20,
                        ),
                        _measureBox("CM")
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
            bottom: 25,
            left: 25,
            right: 25,
            child: Consumer<AppCache>(
              builder: (context, cache, child) {
                return BlueButton(
                  label: "Next",
                  onClick: () {
                    _submitDataAndRedirect(cache);
                    print(cache.user.height);
                  },
                );
              },
            ))
      ],
    ));
  }

  void _submitDataAndRedirect(AppCache cache) {
    cache.setUserData(_selectedGender!, _dateOfBirthController.text,
        _weightController.text, _heightController.text);
  }

  _measureBox(String measure) {
    return Container(
        width: 50,
        height: 50,
        decoration: _measureBoxDecoration(),
        child: Center(
          child: Text(
            measure,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ));
  }

  _measureBoxDecoration() {
    return BoxDecoration(
        boxShadow: const [
          BoxShadow(
              color: Colors.black26, offset: Offset(0, 4), blurRadius: 5.0)
        ],
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.0, 1.0],
          colors: [
            Color(0xffEEA4CE),
            Color(0xffC58BF2),
          ],
        ),
        color: const Color(0xffC58BF2),
        borderRadius: BorderRadius.circular(20));
  }

  OutlineInputBorder myinputborder() {
    return const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(
          color: Color.fromARGB(255, 239, 242, 243),
          width: 1,
        ));
  }

  OutlineInputBorder myfocusborder() {
    return const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(
          color: Color.fromARGB(255, 239, 242, 243),
          width: 1,
        ));
  }
}
