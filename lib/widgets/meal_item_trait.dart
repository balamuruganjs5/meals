import 'package:flutter/material.dart';

class MealitemTrait extends StatelessWidget {
  const MealitemTrait({super.key, required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: 15,
        ),
        const SizedBox(width: 5),
        Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 12),
        ),
      ],
    );
  }
}
