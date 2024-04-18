import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/providers/meals_provider.dart';

class FiltersNotifier extends StateNotifier<Map<Filters, bool>> {
  FiltersNotifier()
      : super({
          Filters.isGlutenFree: false,
          Filters.isLactoseFree: false,
          Filters.isVegetarian: false,
          Filters.isVegan: false,
        });

  void setFilters(Map<Filters, bool> filters) {
    state = filters;
  }

  void setFilter(Filters type, bool value) {
    state = {...state, type: value};
  }
}

// ignore: non_constant_identifier_names
final FiltersProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filters, bool>>(
  (ref) => FiltersNotifier(),
);

// ignore: non_constant_identifier_names
final FilteredMealsProvider = Provider((ref) {
  final meals = ref.watch(MealsProvider);
  final activeFilters = ref.watch(FiltersProvider);

  return meals.where((m) {
    if (activeFilters[Filters.isGlutenFree]! && !m.isGlutenFree) {
      return false;
    }
    if (activeFilters[Filters.isLactoseFree]! && !m.isLactoseFree) {
      return false;
    }
    if (activeFilters[Filters.isVegetarian]! && !m.isVegetarian) {
      return false;
    }
    if (activeFilters[Filters.isVegan]! && !m.isVegan) {
      return false;
    }

    return true;
  }).toList();
});
