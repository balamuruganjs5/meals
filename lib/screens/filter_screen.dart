import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/providers/filters_provider.dart';

class FilterScreen extends ConsumerWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(FiltersProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      // ignore: deprecated_member_use
      body: Column(
        children: [
          SwitchListTile(
            value: activeFilters[Filters.isGlutenFree]!,
            onChanged: (value) {
              ref
                  .read(FiltersProvider.notifier)
                  .setFilter(Filters.isGlutenFree, value);
            },
            title: const Text('GlutenFree'),
            subtitle: const Text('Shows only GlutenFree meals!'),
          ),
          SwitchListTile(
            value: activeFilters[Filters.isLactoseFree]!,
            onChanged: (value) {
              ref
                  .read(FiltersProvider.notifier)
                  .setFilter(Filters.isLactoseFree, value);
            },
            title: const Text('LactoseFree'),
            subtitle: const Text('Shows only isLactoseFree meals!'),
          ),
          SwitchListTile(
            value: activeFilters[Filters.isVegetarian]!,
            onChanged: (value) {
              ref
                  .read(FiltersProvider.notifier)
                  .setFilter(Filters.isVegetarian, value);
            },
            title: const Text('Vegetarian'),
            subtitle: const Text('Shows only isVegetarian meals!'),
          ),
          SwitchListTile(
            value: activeFilters[Filters.isVegan]!,
            onChanged: (value) {
              ref
                  .read(FiltersProvider.notifier)
                  .setFilter(Filters.isVegan, value);
            },
            title: const Text('Vegan'),
            subtitle: const Text('Shows only Vegan meals!'),
          ),
        ],
      ),
    );
  }
}
