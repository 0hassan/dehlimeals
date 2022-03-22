import 'package:dehlimeals/screens/category_meals_screen.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CategoryItem extends StatelessWidget {
  String id, title;
  Color color;

  CategoryItem(
      {Key? key, required this.id, required this.color, required this.title})
      : super(key: key);

  void newPage(context) {
    Navigator.of(context).pushNamed(
      Meals.routeAddress,
      arguments: {
        'id': id,
        'title': title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => newPage(context),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline2,
          ),
        ),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [color.withOpacity(0.3), color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
      radius: 10,
      borderRadius: BorderRadius.circular(15),
    );
  }
}
