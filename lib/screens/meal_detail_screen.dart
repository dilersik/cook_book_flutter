import 'package:flutter/material.dart';

import '../models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)!.settings.arguments as Meal;

    return Scaffold(
      appBar: AppBar(title: Text(meal.title), centerTitle: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 300, width: double.infinity, child: Image.network(meal.imageUrl, fit: BoxFit.cover)),
            _createSectionTitle(context, "Ingredients"),
            ListView.builder(
              shrinkWrap: true, // Makes the ListView take only the necessary space
              physics: NeverScrollableScrollPhysics(), // Prevents conflict with the parent ScrollView
              itemCount: meal.ingredients.length,
              itemBuilder: (ctx, index) {
                return Card(
                  color: Theme.of(context).colorScheme.secondary,
                  child: Padding(padding: const EdgeInsets.all(10), child: Text(meal.ingredients[index])),
                );
              },
            ),
            _createSectionTitle(context, "Steps"),
            ListView.builder(
              shrinkWrap: true, // Makes the ListView take only the necessary space
              physics: NeverScrollableScrollPhysics(), // Prevents conflict with the parent ScrollView
              itemCount: meal.steps.length,
              itemBuilder: (ctx, index) {
                return ListTile(leading: CircleAvatar(child: Text('# ${index + 1}')), title: Text(meal.steps[index]));
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pop(meal.title),
        child: Icon(Icons.star),
      ),
    );
  }

  Widget _createSectionTitle(BuildContext context, String title) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Text(title, style: Theme.of(context).textTheme.titleLarge),
    );
  }
}
