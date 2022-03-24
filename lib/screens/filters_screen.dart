// ignore_for_file: use_function_type_syntax_for_parameters, avoid_types_as_parameter_names
import 'package:dehlimeals/widgets/drawer.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FiltersScreen extends StatefulWidget {
  static const routeName = '/filterd_screen';
  Function saveChanges;
  Map<String, bool> fillters;
  FiltersScreen(
    this.saveChanges,
    this.fillters, {
    Key? key,
  }) : super(key: key);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenfree = false;
  bool _lactosefree = false;
  bool _vegitarian = false;
  bool _vegan = false;
  @override
  void initState() {
    _glutenfree = widget.fillters['gloten']!;
    _lactosefree = widget.fillters['lactose']!;
    _vegitarian = widget.fillters['vegetarian']!;
    _vegan = widget.fillters['vegan']!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => widget.saveChanges({
                    'gloten': _glutenfree,
                    'lactose': _lactosefree,
                    'vegetarian': _vegitarian,
                    'vegan': _vegan,
                  }),
              icon: const Icon(Icons.save))
        ],
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
    Function newval,
  ) {
    return SwitchListTile(
      //tileColor: Theme.of(context).colorScheme.secondary,
      activeColor: Theme.of(context).colorScheme.primary,
      title: Text(title),
      subtitle: Text(subtitile),
      value: current,
      onChanged: (newwal) {
        newval(newwal);
      },
    );
  }
}
