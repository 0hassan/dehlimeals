import 'package:dehlimeals/screens/category_meals_screen.dart';
import 'package:dehlimeals/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'models/dummy_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Dehli Meals",
            style: TextStyle(
              fontFamily: 'RobotoCondensed-Bold',
              fontSize: 28,
            ),
          ),
        ),
        body: GridView(
          padding: const EdgeInsets.all(10),
          children: DUMMY_CATEGORIES
              .map(
                (e) => CategoryItem(id: e.id, color: e.color, title: e.title),
              )
              .toList(),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 220,
            mainAxisSpacing: 10,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
          ),
        ),
      ),
      routes: {
        Meals.routeAddress: (context) => Meals(),
      },
    );
  }
}
