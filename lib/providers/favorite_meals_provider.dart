import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/modal/meal.dart';

class FavouriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavouriteMealsNotifier() : super([]);

  bool toggleFavouriteMeal(Meal meal) {
    final isFavourite = state.contains(meal);

    if (isFavourite) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

// ignore: non_constant_identifier_names
final FavouriteMealsProvider =
    StateNotifierProvider<FavouriteMealsNotifier, List<Meal>>(
        (ref) => FavouriteMealsNotifier());
