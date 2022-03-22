enum Complexity {
  simple,
  medium,
  hard,
}
enum Affordibility {
  afordable,
  pricey,
  luxurious,
}

class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final bool isGlutinFree, isVegetarian, isLactoseFree, isVegan;
  final Affordibility affordibility;
  Meal({
    required this.id,
    required this.categories,
    required this.ingredients,
    required this.title,
    required this.complexity,
    required this.duration,
    required this.isGlutinFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegetarian,
    required this.steps,
    required this.imageUrl,
    required this.affordibility,
  });
}
