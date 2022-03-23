import 'package:dehlimeals/screens/favorite_screen.dart';
import 'package:dehlimeals/screens/home_screen.dart';
import 'package:dehlimeals/widgets/drawer.dart';
import 'package:flutter/material.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({Key? key}) : super(key: key);

  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  final List<Map<String, dynamic>> _pages = [
    {
      'page': const HomeScreen(),
      'title': 'Categories',
    },
    {
      'page': const FavoriteMealsScreen(),
      'title': 'Favorite Meals',
    },
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
      drawer: const DrawerWidget(),
      appBar: AppBar(
        title: Text(
          _pages[_selectedscreenindex]['title'].toString(),
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
      body: _pages[_selectedscreenindex]['page'],
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
