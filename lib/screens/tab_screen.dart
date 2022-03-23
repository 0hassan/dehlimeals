import 'package:dehlimeals/screens/favorite_screen.dart';
import 'package:dehlimeals/screens/home_screen.dart';
import 'package:flutter/material.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({Key? key}) : super(key: key);

  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  final List<Widget> _pages = [
    HomeScreen(),
    FavoriteMealsScreen(),
  ];
  var _selectedscreenindex = 0;
  void _ontapTabBar(int index) {
    setState(() {
      _selectedscreenindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Dehli Meals",
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
      body: _pages[_selectedscreenindex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).canvasColor,
        backgroundColor: Theme.of(context).colorScheme.primary,
        currentIndex: _selectedscreenindex,
        onTap: _ontapTabBar,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Favorite",
          ),
        ],
      ),
    );
  }
}
