import 'package:fitness_app/cache/cache.dart';
import 'package:fitness_app/utils/camera.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/routes.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Camera().loadCameras();
  } catch (exception) {
    print("exception");
  } finally {
    runApp(const MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
        create: (_) => AppCache(),
        child: MaterialApp(
          onGenerateTitle: (context) => "Fitnest X",
          initialRoute: RouterGenerator.homePage,
          onGenerateRoute: RouterGenerator.generateRoute,
          debugShowCheckedModeBanner: false,
        ));
  }
}
