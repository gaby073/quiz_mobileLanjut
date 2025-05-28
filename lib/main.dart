import 'package:flutter/material.dart';
import 'screens/category_screen.dart';

void main() => runApp(MealDBApp());

class MealDBApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TheMealDB',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  final List<String> categories = ['Seafood', 'Dessert', 'Vegan'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TheMealDB')),
      body: CategoryScreen(category: categories[selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.set_meal), label: 'Seafood'),
          BottomNavigationBarItem(icon: Icon(Icons.cake), label: 'Dessert'),
          BottomNavigationBarItem(icon: Icon(Icons.eco), label: 'Vegan'),
        ],
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}
