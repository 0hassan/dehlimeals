import 'package:dehlimeals/models/dummy_data.dart';
import 'package:dehlimeals/models/meal.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Meals extends StatelessWidget {
  static const routeAddress = '/meals_screen';
  // String title, id;
  // Meals({
  //   Key? key,
  //   required this.title,
  //   required this.id,
  // }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArg =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final id = routeArg['id'];
    final title = routeArg['title'];
    final categorieMeals = DUMMY_MEALS.where((element) {
      return element.categories.contains(id);
    }).toList();
    //var length;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title!,
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: ListView.builder(
        itemBuilder: ((context, index) {
          return Text(
            categorieMeals[index].title,
          );
        }),
        itemCount: categorieMeals.length,
      ),
    );
  }
}
