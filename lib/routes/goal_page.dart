import 'package:carousel_slider/carousel_slider.dart';
import 'package:fitness_app/models/goal.dart';
import 'package:fitness_app/styles/app_styles.dart';
import 'package:fitness_app/widgets/buttons/blue_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:provider/provider.dart';
import '../cache/cache.dart';
import '../routes.dart';
import '../widgets/cards/goal_card.dart';

class GoalsPage extends StatefulWidget {
  const GoalsPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _GoalsPageState createState() => _GoalsPageState();
}

class _GoalsPageState extends State<GoalsPage> {
  final CarouselController _carouselController = CarouselController();
  int _indexAtual = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child:
            Scaffold(body: Consumer<AppCache>(builder: (context, cache, child) {
          return Stack(children: [
            SizedBox(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(25),
                    child: Center(
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                // Caso tenha notch, dar padding no topo
                                top: Device.get().isIos &&
                                        MediaQuery.of(context)
                                                .viewPadding
                                                .bottom >
                                            0
                                    ? 20
                                    : 0),
                            child: Text("What is your goal?",
                                style: AppStyles.titleStyle),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.55,
                            margin: const EdgeInsets.only(top: 15),
                            child: Text(
                              "It will help us to choose a best program for you",
                              style: AppStyles.basicTextStyle,
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: CarouselSlider(
                        options: CarouselOptions(
                          height: MediaQuery.of(context).size.height * 0.67,
                          aspectRatio: 16 / 9,
                          viewportFraction: 0.67,
                          enlargeCenterPage: true,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _indexAtual = index;
                            });
                          },
                        ),
                        carouselController: _carouselController,
                        items: cache.goalTypes.map((goal) {
                          return Builder(
                            builder: (BuildContext context) {
                              return AnimatedOpacity(
                                  duration: const Duration(milliseconds: 300),
                                  opacity: _indexAtual ==
                                          cache.goalTypes.indexOf(goal)
                                      ? 1.0
                                      : 0.5,
                                  child: GoalCard(goal: goal));
                            },
                          );
                        }).toList(),
                      )),
                ],
              ),
            ),
            Positioned(
                bottom: 25,
                left: 25,
                right: 25,
                child: BlueButton(
                  label: "Confirm",
                  onClick: () => _selectGoalType(cache, context),
                ))
          ]);
        })));
  }

  void _selectGoalType(AppCache cache, BuildContext context) {
    cache.setUserGoal(cache.goalTypes[_indexAtual]);
    Navigator.of(context).pushNamed(RouterGenerator.picturesPage);
  }
}
