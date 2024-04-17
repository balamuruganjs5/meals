import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key, required this.filters});

  final Map<Filters, bool> filters;
  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var isGlutenFree = false;
  var isLactoseFree = false;
  var isVegetarian = false;
  var isVegan = false;

  @override
  void initState() {
    isGlutenFree = widget.filters[Filters.isGlutenFree]!;
    isLactoseFree = widget.filters[Filters.isLactoseFree]!;
    isVegetarian = widget.filters[Filters.isVegetarian]!;
    isVegan = widget.filters[Filters.isVegan]!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      // ignore: deprecated_member_use
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            Filters.isGlutenFree: isGlutenFree,
            Filters.isLactoseFree: isLactoseFree,
            Filters.isVegetarian: isVegetarian,
            Filters.isVegan: isVegan,
          });

          return false;
        },
        child: Column(
          children: [
            SwitchListTile(
              value: isGlutenFree,
              onChanged: (value) {
                setState(() {
                  isGlutenFree = value;
                });
              },
              title: const Text('GlutenFree'),
              subtitle: const Text('Shows only GlutenFree meals!'),
            ),
            SwitchListTile(
              value: isLactoseFree,
              onChanged: (value) {
                setState(() {
                  isLactoseFree = value;
                });
              },
              title: const Text('LactoseFree'),
              subtitle: const Text('Shows only isLactoseFree meals!'),
            ),
            SwitchListTile(
              value: isVegetarian,
              onChanged: (value) {
                setState(() {
                  isVegetarian = value;
                });
              },
              title: const Text('Vegetarian'),
              subtitle: const Text('Shows only isVegetarian meals!'),
            ),
            SwitchListTile(
              value: isVegan,
              onChanged: (value) {
                setState(() {
                  isVegan = value;
                });
              },
              title: const Text('Vegan'),
              subtitle: const Text('Shows only Vegan meals!'),
            ),
          ],
        ),
      ),
    );
  }
}
