import 'package:dehlimeals/widgets/meal_item.dart';
import 'package:flutter/material.dart';

import '../models/meal.dart';

// ignore: must_be_immutable
class Meals extends StatefulWidget {
  static const routeAddress = '/meals_screen';
  final List<Meal> availablemeals;
  const Meals(this.availablemeals, {Key? key}) : super(key: key);

  @override
  State<Meals> createState() => _MealsState();
}

class _MealsState extends State<Meals> {
  late String title;
  late List<Meal> categorieMeals;
  var cheack = false;

  @override
  didChangeDependencies() {
    if (!cheack) {
      final routeArg =
          ModalRoute.of(context)!.settings.arguments as Map<String, String>;
      final id = routeArg['id'];
      title = routeArg['title']!;
      categorieMeals = widget.availablemeals.where((element) {
        return element.categories.contains(id);
      }).toList();
      cheack = true;
    }
    super.didChangeDependencies();
  }

  void deleteItem(String id) {
    setState(() {
      categorieMeals.removeWhere((element) => element.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
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
