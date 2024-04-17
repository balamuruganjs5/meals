import 'package:flutter/material.dart';
import 'package:meals/modal/meal.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen(
      {super.key, required this.meal, required this.toggleFavourites});

  final Meal meal;

  final Function() toggleFavourites;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          meal.title,
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontSize: 14,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              toggleFavourites();
              // Navigator.pop(context);
            },
            icon: const Icon(Icons.favorite),
            color: Theme.of(context).colorScheme.primary,
          )
        ],
        // backgroundColor: Theme.of(context).colorScheme.onBackground,
      ),
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black87, Colors.black54],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            children: [
              Image.network(
                meal.imageUrl,
                height: 200,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
              const SizedBox(height: 14),
              Text(
                "Ingredients",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.amber.shade400,
                    ),
              ),
              const SizedBox(height: 8),
              for (final ingredient in meal.ingredients)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  child: Text(
                    ingredient,
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          color: Theme.of(context).colorScheme.background,
                        ),
                  ),
                ),
              const SizedBox(height: 14),
              Text(
                "Steps",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.amber.shade400,
                    ),
              ),
              const SizedBox(height: 8),
              for (final step in meal.steps)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  child: Text(
                    step,
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          color: Theme.of(context).colorScheme.background,
                        ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
