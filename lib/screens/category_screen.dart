import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';
import 'detail_screen.dart';

class CategoryScreen extends StatelessWidget {
  final String category;

  const CategoryScreen({required this.category});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiService.fetchMeals(category),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final meals = snapshot.data as List<Meal>;
          return GridView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: meals.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
            ),
            itemBuilder: (context, index) {
              final meal = meals[index];
              return MealItem(
                meal: meal,
                onTap: () => Navigator.push(context, MaterialPageRoute(
                  builder: (_) => DetailScreen(id: meal.id, imageUrl: meal.imageUrl, name: meal.name),
                )),
              );
            },
          );
        } else if (snapshot.hasError) {
          return Center(child: Text('Failed to load data'));
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
