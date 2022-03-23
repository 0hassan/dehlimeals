// ignore_for_file: use_function_type_syntax_for_parameters, avoid_types_as_parameter_names

import 'package:dehlimeals/widgets/drawer.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filterd_screen';
  const FiltersScreen({Key? key}) : super(key: key);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenfree = false;
  var _lactosefree = false;
  var _vegitarian = false;
  var _vegan = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        title: Text(
          'Settings',
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            child: Text(
              'Adjust your Meals selection.',
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
          Expanded(
            child: Column(
              children: [
                switchlisttile(
                  'Gluten Free',
                  'All Meals without gluten.',
                  _glutenfree,
                  (newValue) {
                    setState(() {
                      _glutenfree = newValue;
                    });
                    throw () {};
                  },
                ),
                switchlisttile(
                  'Lactose Free',
                  'All Meals without Lactose.',
                  _lactosefree,
                  (newValue) {
                    setState(() {
                      _lactosefree = newValue;
                    });
                    throw () {};
                  },
                ),
                switchlisttile(
                  'Vegitarian',
                  'All Meals for Vagetarian.',
                  _vegitarian,
                  (newValue) {
                    setState(() {
                      _vegitarian = newValue;
                    });
                    throw () {};
                  },
                ),
                switchlisttile(
                  'Vagan',
                  'All Meals without gluten.',
                  _vegan,
                  (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                    throw () {};
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget switchlisttile(
    String title,
    String subtitile,
    var current,
    Function newval(bool),
  ) {
    return SwitchListTile(
      //tileColor: Theme.of(context).colorScheme.secondary,
      activeColor: Theme.of(context).colorScheme.primary,
      title: Text(title),
      subtitle: Text(subtitile),
      value: current,
      onChanged: newval,
    );
  }
}
