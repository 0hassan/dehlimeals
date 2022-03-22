import 'package:dehlimeals/models/dummy_data.dart';
import 'package:flutter/material.dart';

class MealDetails extends StatelessWidget {
  static const routeName = '/meal_details/screen';
  const MealDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments;
    final selectedmeal = DUMMY_MEALS.firstWhere((element) => id == element.id);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectedmeal.title,
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 250,
              child: Image.network(
                selectedmeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildTitle(context, "INGREDIENTS"),
            buildSubTitle(
              context,
              ListView.builder(
                itemBuilder: ((context, index) => Container(
                      margin: const EdgeInsets.all(7),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.lightGreen,
                      ),
                      child: Text(
                        selectedmeal.ingredients[index],
                        style: Theme.of(context).textTheme.headline1,
                        //textAlign: TextAlign.center,
                      ),
                    )),
                itemCount: selectedmeal.ingredients.length,
              ),
            ),
            buildTitle(context, "STEPS"),
            buildSubTitle(
              context,
              ListView.builder(
                itemBuilder: ((context, index) => Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            child: Text('# ${(index + 1)}'),
                          ),
                          title: Text(
                            selectedmeal.steps[index],
                          ),
                        ),
                        const Divider(),
                      ],
                    )),
                itemCount: selectedmeal.steps.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTitle(BuildContext context, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline2,
      ),
    );
  }

  Widget buildSubTitle(BuildContext context, Widget child) {
    return Container(
      height: 190,
      width: 380,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(6),
      child: child,
    );
  }
}
