import 'package:dehlimeals/screens/category_meals_screen.dart';
import 'package:dehlimeals/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dehli Meals',
      theme: ThemeData(
        canvasColor: const Color.fromARGB(253, 227, 231, 188),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.cyan)
            .copyWith(secondary: Colors.lightGreen),
        textTheme: ThemeData.light().textTheme.copyWith(
              headline1: const TextStyle(
                color: Colors.black,
                fontFamily: 'RobotoCondenced-Bold',
                fontSize: 28,
                //fontWeight: FontWeight.bold,
              ),
              headline2: const TextStyle(
                fontFamily: 'Raleway-Black',
                fontSize: 24,
                color: Colors.black,
              ),
            ),
      ),

      // ignore: prefer_const_constructors
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        Meals.routeAddress: (context) => Meals(),
      },
    );
  }
}
