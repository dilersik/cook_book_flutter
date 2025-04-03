import 'package:cook_book_flutter/models/meal.dart';
import 'package:cook_book_flutter/screens/category_meals_screen.dart';
import 'package:cook_book_flutter/screens/meal_detail_screen.dart';
import 'package:cook_book_flutter/screens/settings_screen.dart';
import 'package:cook_book_flutter/screens/tabs_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'data/dummy_data.dart';
import 'screens/app_routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  List<Meal> _availableMeals = dummyMeals;

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
          titleLarge: TextStyle(fontSize: 20, fontFamily: "RobotoCondensed-Bold", fontWeight: FontWeight.bold),
        ),
      ),
      home: TabsScreen(),
      routes: {
        // "/": (context) => CategoriesScreen(),
        AppRoutes.CATEGORY_MEALS: (context) => CategoryMealsScreen(meals: _availableMeals),
        AppRoutes.MEAL_DETAIL: (context) => MealDetailScreen(),
        AppRoutes.SETTINGS: (context) => SettingsScreen(),
      },
      onGenerateRoute: (settings) {
        if (kDebugMode) {
          print("onGenerateRoute: ${settings.name}");
        }
        return MaterialPageRoute(
          builder: (context) => TabsScreen(),
        );
      },
      onUnknownRoute: (settings) {
        if (kDebugMode) {
          print("onUnknownRoute: ${settings.name}");
        }
        return MaterialPageRoute(
          builder: (context) => TabsScreen(),
        );
      },
    );
  }
}
