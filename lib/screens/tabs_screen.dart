import 'package:flutter/material.dart';

import 'categories_screen.dart';
import 'favorite_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  final List<Map<String, Widget>> _pages = [
    {'page': const CategoriesScreen(), 'title': const Text("Categories")},
    {'page': const FavoriteScreen(), 'title': const Text("My Favorites")},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: _pages[_selectedPageIndex]['title'], centerTitle: true),
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
