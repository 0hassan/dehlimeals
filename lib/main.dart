import 'package:dehlimeals/models/dummy_data.dart';
import 'package:dehlimeals/models/meal.dart';
import 'package:dehlimeals/screens/filters_screen.dart';

import './screens/category_meals_screen.dart';
import './screens/home_screen.dart';
import './screens/meal_details_screeen.dart';
import './screens/tab_screen.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Meal> _favoritelist = [];
  Map<String, bool> _fillters = {
    'gloten': false,
    'lactose': false,
    'vegetarian': false,
    'vegan': false,
  };

  List<Meal> _availablemeals = DUMMY_MEALS;

  void saveChanges(Map<String, bool> filter) {
    setState(() {
      _fillters = filter;
      _availablemeals = DUMMY_MEALS.where((element) {
        if (!element.isGlutinFree && _fillters['gloten']!) return false;
        if (!element.isLactoseFree && _fillters['lactose']!) return false;
        if (!element.isVegan && _fillters['vegan']!) return false;
        if (!element.isVegetarian && _fillters['vegetarian']!) return false;
        return true;
      }).toList();
    });
  }

  bool _isfavorite(String id) {
    return _favoritelist.any((element) => element.id == id);
  }

  void _toglefavorite(String id) {
    final cheacker = _favoritelist.indexWhere((element) => element.id == id);
    if (cheacker < 0) {
      setState(() {
        _favoritelist
            .add(DUMMY_MEALS.firstWhere((element) => element.id == id));
      });
    } else {
      setState(() {
        _favoritelist.removeAt(cheacker);
      });
    }
  }

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
                fontWeight: FontWeight.bold,
                fontFamily: 'RobotoCondenced-Bold',
                fontSize: 24,
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
        '/': (context) => TabBarScreen(_favoritelist),
        Meals.routeAddress: (context) => Meals(_availablemeals),
        MealDetails.routeName: (context) => MealDetails(
              _toglefavorite,
              _isfavorite,
            ),
        HomeScreen.routeName: (context) => const HomeScreen(),
        FiltersScreen.routeName: (context) =>
            FiltersScreen(saveChanges, _fillters),
      },
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          builder: ((context) => TabBarScreen(
                _favoritelist,
              )),
        );
      },
    );
  }
}
