import 'package:cook_book_flutter/screens/categories_screen.dart';
import 'package:cook_book_flutter/screens/category_meals_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.pink,
          foregroundColor: Colors.white,
          titleTextStyle: TextStyle(fontFamily: 'RobotoCondensed', fontSize: 20, fontWeight: FontWeight.bold),
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple, // Use a solid color
          primary: Colors.pink,
          secondary: Colors.amber,
        ),
        fontFamily: "Raleway",
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
          titleLarge: TextStyle(fontSize: 20, fontFamily: "RobotoCondensed"),
        ),
      ),
      home: CategoriesScreen(),
      routes: {
        "/category-meals": (context) => CategoryMealsScreen(),
      },
    );
  }
}
