import 'package:flutter/material.dart';

import '../models/dummy_data.dart';
import '../widgets/category_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const routeName = '/HomeScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
