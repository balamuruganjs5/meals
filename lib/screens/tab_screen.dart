import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/modal/meal.dart';
import 'package:meals/screens/category_screen.dart';
import 'package:meals/screens/filter_screen.dart';
import 'package:meals/screens/meal_screen.dart';
import 'package:meals/widgets/drawer.dart';

const Map<Filters, bool> initialValuesOfFilters = {
  Filters.isGlutenFree: false,
  Filters.isLactoseFree: false,
  Filters.isVegetarian: false,
  Filters.isVegan: false,
};

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  var activeIndex = 0;

  final List<Meal> favouriteMeals = [];

  Map<Filters, bool> selectedFilters = initialValuesOfFilters;

  void toggleScreen(int index) {
    setState(() {
      activeIndex = index;
    });
  }

  void showMessages(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  void toggleFavourites(Meal meal) {
    final isFavourite = favouriteMeals.contains(meal);
    if (isFavourite) {
      setState(() {
        favouriteMeals.remove(meal);
      });
      showMessages('Marked as unfavourite!');
    } else {
      setState(() {
        favouriteMeals.add(meal);
      });
      showMessages('Marked as favourite!');
    }
  }

  void switchDrawerScreen(String type) async {
    Navigator.of(context).pop();

    if (type == 'filters') {
      final result = await Navigator.of(context).push<Map<Filters, bool>>(
        MaterialPageRoute(
          builder: (ctx) => FilterScreen(filters: selectedFilters),
        ),
      );
      setState(() {
        selectedFilters = result ?? initialValuesOfFilters;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final mealsData = meals.where((m) {
      if (selectedFilters[Filters.isGlutenFree]! && !m.isGlutenFree) {
        return false;
      }
      if (selectedFilters[Filters.isLactoseFree]! && !m.isLactoseFree) {
        return false;
      }
      if (selectedFilters[Filters.isVegetarian]! && !m.isVegetarian) {
        return false;
      }
      if (selectedFilters[Filters.isVegan]! && !m.isVegan) {
        return false;
      }

      return true;
    }).toList();

    Widget activeScreen = CategoryScreen(
      toggleFavourites: toggleFavourites,
      mealsData: mealsData,
    );

    String title = "Go with Categories!";

    if (activeIndex == 1) {
      title = "Your Favourites";
      activeScreen = MealScreen(
        meals: favouriteMeals,
        toggleFavourites: toggleFavourites,
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
