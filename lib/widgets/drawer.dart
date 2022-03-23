import '../screens/filters_screen.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  ontapmeals(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(
      '/',
    );
  }

  ontapsettings(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(
      FiltersScreen.routeName,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            child: Text(
              'Settings',
              style: Theme.of(context).textTheme.headline1,
            ),
            color: Theme.of(context).colorScheme.primary,
            height: 90,
            width: double.infinity,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(top: 40, left: 20),
          ),
          const SizedBox(
            height: 10,
          ),
          buildlisttile(context, Icons.restaurant, 'Meals', ontapmeals),
          buildlisttile(context, Icons.settings, 'Filters', ontapsettings),
        ],
      ),
    );
  }

  Widget buildlisttile(
      BuildContext context, IconData icon, String title, Function ontap) {
    return ListTile(
      onTap: (() {
        ontap(context);
      }),
      leading: Icon(
        icon,
        size: 24,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.headline2,
      ),
    );
  }
}
