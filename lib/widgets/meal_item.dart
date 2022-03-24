import 'package:dehlimeals/models/meal.dart';
import 'package:dehlimeals/screens/meal_details_screeen.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MealItem extends StatelessWidget {
  final String title, url, id;
  final int duration;
  final Complexity complexity;
  final Affordibility affordibility;

  const MealItem({
    required this.id,
    required this.title,
    required this.url,
    required this.affordibility,
    required this.complexity,
    required this.duration,
    Key? key,
  }) : super(key: key);

  void ontap(BuildContext context) {
    Navigator.of(context)
        .pushNamed(
          MealDetails.routeName,
          arguments: id,
        )
        .then((value) {});
  }

  String getcomplexity() {
    switch (complexity) {
      case Complexity.simple:
        return 'Simple';
      case Complexity.medium:
        return 'Medium';
      case Complexity.hard:
        return 'Hard';
      default:
        return 'Unknown';
    }
  }

  String getaffordability() {
    switch (affordibility) {
      case Affordibility.afordable:
        return 'Affordable';
      case Affordibility.pricey:
        return 'Pricey';
      case Affordibility.luxurious:
        return 'Luxurious';
      default:
        return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => ontap(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    url,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  left: 15,
                  bottom: 15,
                  child: Container(
                    width: 250,
                    color: Colors.black45,
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    const Icon(Icons.schedule),
                    const SizedBox(width: 6),
                    Text(duration.toString()),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.work),
                    const SizedBox(width: 6),
                    Text(getcomplexity()),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.attach_money),
                    const SizedBox(width: 6),
                    Text(getaffordability()),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
