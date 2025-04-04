import 'package:cook_book_flutter/models/meal.dart';
import 'package:cook_book_flutter/screens/category_meals_screen.dart';
import 'package:cook_book_flutter/screens/meal_detail_screen.dart';
import 'package:cook_book_flutter/screens/settings_screen.dart';
import 'package:cook_book_flutter/screens/tabs_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'data/dummy_data.dart';
import 'models/settings.dart';
import 'screens/app_routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Settings settings = Settings();
  List<Meal> _availableMeals = dummyMeals;
  final List<Meal> _favoriteMeals = [];

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
      home: TabsScreen(favoriteMeals: _favoriteMeals),
      routes: {
        // "/": (context) => CategoriesScreen(),
        AppRoutes.CATEGORY_MEALS: (context) => CategoryMealsScreen(meals: _availableMeals),
        AppRoutes.MEAL_DETAIL: (context) => MealDetailScreen(onToggleFavorite: _toggleFavorite, isFavorite: _isFavorite,),
        AppRoutes.SETTINGS: (context) => SettingsScreen(settings: settings, onSettingsChanged: _filterMeals),
      },
      onGenerateRoute: (settings) {
        if (kDebugMode) {
          print("onGenerateRoute: ${settings.name}");
        }
        return MaterialPageRoute(builder: (context) => TabsScreen(favoriteMeals: _favoriteMeals));
      },
      onUnknownRoute: (settings) {
        if (kDebugMode) {
          print("onUnknownRoute: ${settings.name}");
        }
        return MaterialPageRoute(builder: (context) => TabsScreen(favoriteMeals: _favoriteMeals));
      },
    );
  }

  void _filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;
      _availableMeals =
          dummyMeals.where((meal) {
            final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
            final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
            final filterVegan = settings.isVegan && !meal.isVegan;
            final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;

            return !filterGluten && !filterLactose && !filterVegan && !filterVegetarian;
          }).toList();
    });
  }

  void _toggleFavorite(Meal meal) {
    setState(() {
      if (_favoriteMeals.contains(meal)) {
        _favoriteMeals.remove(meal);
      } else {
        _favoriteMeals.add(meal);
      }
    });
  }

  bool _isFavorite(Meal meal) {
    return _favoriteMeals.contains(meal);
  }
}
