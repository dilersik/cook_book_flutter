import 'package:cook_book_flutter/screens/categories_screen.dart';
import 'package:cook_book_flutter/screens/favorite_screen.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatelessWidget {
  const TabsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Let's cook?"),
          centerTitle: true,
          bottom: const TabBar(
            indicatorColor: Colors.white, // Color of the selected tab's underline
            labelColor: Colors.white, // Color of the selected tab's text and icon
            unselectedLabelColor: Colors.white54, // Color of the unselected tabs
            tabs: [
              Tab(icon: Icon(Icons.category), text: "Categories"),
              Tab(icon: Icon(Icons.star), text: "Favorites"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            CategoriesScreen(),
            FavoriteScreen(),
          ],
        ),
      ),
    );
  }
}