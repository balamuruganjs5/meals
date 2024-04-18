import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/modal/category.dart';
import 'package:meals/modal/meal.dart';
import 'package:meals/screens/meal_screen.dart';
import 'package:meals/widgets/category_item.dart';

class CategoryScreen extends ConsumerWidget {
  const CategoryScreen({
    super.key,
    required this.mealsData,
  });
  final List<Meal> mealsData;

  void selectCategory(BuildContext context, Category category) {
    final filteredCategory =
        mealsData.where((m) => m.categories.contains(category.id)).toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealScreen(
          title: category.title,
          meals: filteredCategory,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black,
      ),
      child: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        children: [
          for (final category in available_category)
            CategoryItem(
                category: category,
                selectCategory: () {
                  selectCategory(context, category);
                })
        ],
      ),
    );
  }
}
