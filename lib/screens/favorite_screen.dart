import 'package:dehlimeals/models/meal.dart';
import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';

class FavoriteMealsScreen extends StatelessWidget {
  final List<Meal> categorieMeals;
  const FavoriteMealsScreen(this.categorieMeals, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (categorieMeals.isEmpty) {
      return Text(
        "You Dont Have Any Favorite Foods Yet.",
        style: Theme.of(context).textTheme.headline2,
      );
    } else {
      return ListView.builder(
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
      );
    }
  }
}
