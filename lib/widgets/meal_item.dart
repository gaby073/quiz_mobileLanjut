import 'package:flutter/material.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final Meal meal;
  final VoidCallback onTap;

  const MealItem({required this.meal, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Hero(
        tag: meal.id,
        child: Card(
          child: Column(
            children: [
              Image.network(meal.imageUrl, height: 100, width: double.infinity, fit: BoxFit.cover),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(meal.name, textAlign: TextAlign.center),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
