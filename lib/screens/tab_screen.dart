import 'package:dehlimeals/screens/favorite_screen.dart';
import 'package:dehlimeals/screens/home_screen.dart';
import 'package:flutter/material.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({Key? key}) : super(key: key);

  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Dehli Meals",
            style: Theme.of(context).textTheme.headline2,
          ),
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.category),
                text: "Categories",
              ),
              Tab(
                icon: Icon(Icons.star),
                text: "Favorite",
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            HomeScreen(),
            FavoriteMealsScreen(),
          ],
        ),
      ),
    );
  }
}
