import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/meal.dart';

class ApiService {
  static Future<List<Meal>> fetchMeals(String category) async {
    final url = Uri.parse('https://www.themealdb.com/api/json/v1/1/filter.php?c=$category');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List meals = data['meals'];
      return meals.map((meal) => Meal.fromJson(meal)).toList();
    } else {
      throw Exception('Failed to load meals');
    }
  }

  static Future<String> fetchMealDetail(String id) async {
    final url = Uri.parse('https://www.themealdb.com/api/json/v1/1/lookup.php?i=$id');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['meals'][0]['strInstructions'];
    } else {
      throw Exception('Failed to load detail');
    }
  }
}
