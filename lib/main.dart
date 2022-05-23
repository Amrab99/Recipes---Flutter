import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:recipes/dummy_data.dart';
import 'package:recipes/modules/meal.dart';
import 'package:recipes/screens/filters_screens.dart';
import 'package:recipes/screens/meal_details_screen.dart';
import 'package:recipes/screens/meals_categories_screen.dart';
import 'package:recipes/screens/tabs_screen.dart';

void main() => runApp(const MyApp());

// My app it's just for control  app setting
class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };


  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _toggleFavorite(String mealId){
    final existingIndex = _favoriteMeals.indexWhere((meal) => mealId==meal.id);

    if(existingIndex>=0){
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    }
    else {
      setState(() {
        _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id==mealId));
      });
    }
  }

  bool _isFavorite(String mealId){
    return _favoriteMeals.any((meal) => mealId==meal.id);
  }

  void _setFilters(Map<String, bool> _filtersData) {
    setState(() {
      _filters = _filtersData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (!meal.isGlutenFree && _filters['gluten']) {
          return false;
        }
        if (!meal.isLactoseFree && _filters['lactose']) {
          return false;
        }
        if (!meal.isVegan && _filters['vegan']) {
          return false;
        }
        if (!meal.isVegetarian && _filters['vegetarian']) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RECIPES',
      theme: ThemeData(
          primarySwatch: Colors.red,
          accentColor: Colors.amber,
          //this color for page background color.
          canvasColor: const Color.fromRGBO(255, 254, 229, 1),
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(color: Color.fromRGBO(20, 50, 50, 1)),
              bodyText2: const TextStyle(color: Color.fromRGBO(20, 50, 50, 1)),
              headline1: const TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ))),
      //const MyHomePage(title: 'RECIPES')
      routes: {
        '/': (context) => TabsScreen(_favoriteMeals),
        MealsCategoriesScreen.routeName: (context) =>
            MealsCategoriesScreen(_availableMeals),
        MealDetailsScreen.routeName: (context) => MealDetailsScreen(_toggleFavorite,_isFavorite),
        FiltersScreen.routeName: (context) => FiltersScreen(_setFilters,_filters),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, @required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('widget.title'),
      ),
      body: null,
    );
  }
}
