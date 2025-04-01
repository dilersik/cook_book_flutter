import 'package:cook_book_flutter/data/dummy_data.dart';
import 'package:flutter/material.dart';

import '../widgets/category_item_widget.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Let's cook?"), centerTitle: true),
      body: GridView(
        padding: const EdgeInsets.all(25),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 1.5,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children:
            dummyCategories.map((category) {
              return CategoryItemWidget(category: category);
            }).toList(),
      ),
    );
  }
}
