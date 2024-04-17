import 'package:flutter/material.dart';
import 'package:meals/modal/meal.dart';
import 'package:meals/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem(
      {super.key, required this.meal, required this.moveToDetailsScreen});

  final Meal meal;
  final Function() moveToDetailsScreen;

  String get complexityName {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get affordabilityName {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: InkWell(
        onTap: moveToDetailsScreen,
        child: Stack(
          clipBehavior: Clip.hardEdge,
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black38,
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            color: Theme.of(context).colorScheme.background,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        MealitemTrait(
                          icon: Icons.schedule,
                          text: "${meal.duration} min",
                        ),
                        MealitemTrait(
                          icon: Icons.work,
                          text: complexityName,
                        ),
                        MealitemTrait(
                          icon: Icons.attach_money,
                          text: affordabilityName,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
