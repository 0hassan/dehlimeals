import 'package:flutter/material.dart';

class MealDetails extends StatelessWidget {
  static const routeName = '/meal_details/screen';
  const MealDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Meals details",
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
      body: Center(
        child: Text(id.toString()),
      ),
    );
  }
}
