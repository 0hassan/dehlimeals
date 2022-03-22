import 'package:dehlimeals/models/dummy_data.dart';
import 'package:dehlimeals/widgets/meal_item.dart';
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
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
      body: ListView.builder(
        itemBuilder: ((context, index) {
          return MealItem(
            id: categorieMeals[index].id,
            title: categorieMeals[index].title,
            url: categorieMeals[index].imageUrl,
            affordibility: categorieMeals[index].affordibility,
            complexity: categorieMeals[index].complexity,
            duration: categorieMeals[index].duration,
          );
        }),
        itemCount: categorieMeals.length,
      ),
    );
  }
}
