import 'package:cook_book_flutter/models/meal.dart';
import 'package:cook_book_flutter/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

import 'categories_screen.dart';
import 'favorite_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  const TabsScreen({super.key, required this.favoriteMeals});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  late List<Map<String, Widget>> _pages;

  @override
  void initState() {
    super.initState();

    _pages = [
      {'page': const CategoriesScreen(), 'title': const Text("Categories")},
      {'page': FavoriteScreen(favoriteMeals: widget.favoriteMeals), 'title': const Text("My Favorites")},
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: _pages[_selectedPageIndex]['title'], centerTitle: true),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        unselectedItemColor: Colors.white54,
        selectedItemColor: Colors.white,
        backgroundColor: Theme.of(context).colorScheme.primary,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(icon: const Icon(Icons.category), label: 'Categories'),
          BottomNavigationBarItem(icon: const Icon(Icons.star), label: 'Favorites'),
        ],
      ),
    );

    // return DefaultTabController(
    //   length: 2,
    //   child: Scaffold(
    //     appBar: AppBar(
    //       title: const Text("Let's cook?"),
    //       centerTitle: true,
    //       bottom: const TabBar(
    //         indicatorColor: Colors.white, // Color of the selected tab's underline
    //         labelColor: Colors.white, // Color of the selected tab's text and icon
    //         unselectedLabelColor: Colors.white54, // Color of the unselected tabs
    //         tabs: [
    //           Tab(icon: Icon(Icons.category), text: "Categories"),
    //           Tab(icon: Icon(Icons.star), text: "Favorites"),
    //         ],
    //       ),
    //     ),
    //     body: const TabBarView(
    //       children: [
    //         CategoriesScreen(),
    //         FavoriteScreen(),
    //       ],
    //     ),
    //   ),
    // );
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }
}
