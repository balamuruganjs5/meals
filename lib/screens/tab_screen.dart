import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/data/dummy_data.dart';

import 'package:meals/providers/favorite_meals_provider.dart';
import 'package:meals/providers/filters_provider.dart';
import 'package:meals/screens/category_screen.dart';
import 'package:meals/screens/filter_screen.dart';
import 'package:meals/screens/meal_screen.dart';
import 'package:meals/widgets/drawer.dart';

class TabScreen extends ConsumerStatefulWidget {
  const TabScreen({super.key});

  @override
  ConsumerState<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends ConsumerState<TabScreen> {
  var activeIndex = 0;

  void toggleScreen(int index) {
    setState(() {
      activeIndex = index;
    });
  }

  void switchDrawerScreen(String type) async {
    Navigator.of(context).pop();

    if (type == 'filters') {
      Navigator.of(context).push<Map<Filters, bool>>(
        MaterialPageRoute(
          builder: (ctx) => const FilterScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final mealsData = ref.watch(FilteredMealsProvider);

    Widget activeScreen = CategoryScreen(
      mealsData: mealsData,
    );

    String title = "Go with Categories!";

    if (activeIndex == 1) {
      title = "Your Favourites";
      final favouriteMeals = ref.watch(FavouriteMealsProvider);
      activeScreen = MealScreen(
        meals: favouriteMeals,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontSize: 14,
          ),
        ),
      ),
      drawer: DrawerScreen(switchDrawerScreen: switchDrawerScreen),
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: activeIndex,
        onTap: (value) {
          toggleScreen(value);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.set_meal), label: "Meal"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "Favourite"),
        ],
      ),
    );
  }
}
