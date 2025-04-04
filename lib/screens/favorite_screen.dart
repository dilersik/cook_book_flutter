import 'package:flutter/material.dart';

import '../models/meal.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  const FavoriteScreen({super.key, required this.favoriteMeals});

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return const Center(child: Text("You have no favorites yet!"));
    } else {
      return ListView.builder(
        itemCount: favoriteMeals.length,
        itemBuilder: (ctx, index) {
          return ListTile(
            leading: CircleAvatar(backgroundImage: NetworkImage(favoriteMeals[index].imageUrl)),
            title: Text(favoriteMeals[index].title),
            subtitle: Text(favoriteMeals[index].complexityText),
          );
        },
      );
    }
  }
}
