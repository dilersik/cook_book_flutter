import 'package:cook_book_flutter/models/category.dart';
import 'package:flutter/material.dart';

class CategoryItemWidget extends StatelessWidget {
  final Category category;

  const CategoryItemWidget({super.key, required this.category});

  void _selectCategory(BuildContext context) {
    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (_) {
    //       return CategoryMealsScreen(category: category);
    //     },
    //   ),
    // );
    Navigator.of(context).pushNamed("/category-meals", arguments: category);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectCategory(context),
      borderRadius: BorderRadius.circular(15),
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [category.color.withValues(alpha: 0.7), category.color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(category.title, style: Theme.of(context).textTheme.titleLarge),
      ),
    );
  }
}
