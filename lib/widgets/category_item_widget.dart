import 'package:cook_book_flutter/models/category.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {

  final Category category;

  const CategoryItem({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Text(category.title),
    );
  }

}