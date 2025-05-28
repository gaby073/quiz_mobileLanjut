import 'package:flutter/material.dart';
import '../services/api_service.dart';

class DetailScreen extends StatelessWidget {
  final String id;
  final String imageUrl;
  final String name;

  const DetailScreen({required this.id, required this.imageUrl, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: ApiService.fetchMealDetail(id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                Hero(
                  tag: id,
                  child: Image.network(imageUrl, height: 200, fit: BoxFit.cover, width: double.infinity),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(snapshot.data as String),
                )
              ],
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error loading detail'));
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
