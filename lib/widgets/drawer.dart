import 'package:flutter/material.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key, required this.switchDrawerScreen});

  final Function(String type) switchDrawerScreen;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.onBackground.withOpacity(0.95),
                  Theme.of(context).colorScheme.onBackground.withOpacity(0.4)
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.food_bank,
                  color: Theme.of(context).colorScheme.background,
                ),
                const SizedBox(width: 10),
                Text(
                  "Your Meals!",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.background,
                  ),
                )
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.category),
            title: const Text("Categories"),
            onTap: () {
              switchDrawerScreen('categories');
            },
          ),
          ListTile(
            leading: const Icon(Icons.filter),
            title: const Text("Filters"),
            onTap: () {
              switchDrawerScreen('filters');
            },
          ),
        ],
      ),
    );
  }
}
