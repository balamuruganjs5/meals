import 'package:flutter/material.dart';
import 'package:meals/modal/meal.dart';
import 'package:meals/screens/meal_details_screen.dart';
import 'package:meals/widgets/meal_item.dart';

class MealScreen extends StatelessWidget {
  const MealScreen({
    super.key,
    this.title,
    required this.meals,
    required this.toggleFavourites,
  });

  final String? title;
  final List<Meal> meals;
  final Function(Meal meal) toggleFavourites;

  void moveToDetailsScreen(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealDetailsScreen(
            meal: meal,
            toggleFavourites: () {
              toggleFavourites(meal);
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Oh... Oops, No meals in this category!",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.background,
                ),
          ),
          const SizedBox(height: 20),
          Text(
            "Plaase go back and select another category.",
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Theme.of(context).colorScheme.background,
                ),
          ),
        ],
      ),
    );

    if (meals.isNotEmpty) {
      content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) => MealItem(
            meal: meals[index],
            moveToDetailsScreen: () {
              moveToDetailsScreen(context, meals[index]);
            }),
      );
    }

    if (title == null) {
      return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black87, Colors.black54],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: content,
      );
    }

    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Theme.of(context).colorScheme.onBackground,
        title: Text(
          title!,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
            fontSize: 14,
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black87, Colors.black54],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: content,
      ),
    );
  }
}
