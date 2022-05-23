import 'package:flutter/material.dart';
import 'package:recipes/modules/meal.dart';
import 'package:recipes/widgets/main_drawer.dart';
import 'package:recipes/widgets/meal_item.dart';

class MealsCategoriesScreen extends StatefulWidget {
  static const routeName = 'category_meals';

  final List<Meal> _availableMeals;

  MealsCategoriesScreen(this._availableMeals);

  @override
  _MealsCategoriesScreenState createState() => _MealsCategoriesScreenState();
}

class _MealsCategoriesScreenState extends State<MealsCategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    final routArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = routArgs['id'];
    final categoryTitle = routArgs['title'];
    final categoryMeal = widget._availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle)),
      body: ListView.builder(
          itemBuilder: (context, index) {
            return MealItem(
              id: categoryMeal[index].id,
              title: categoryMeal[index].title,
              affordability: categoryMeal[index].affordability,
              complexity: categoryMeal[index].complexity,
              duration: categoryMeal[index].duration,
              imageUrl: categoryMeal[index].imageUrl,
            );
          },
          itemCount: categoryMeal.length),
      drawer: MainDrawer(),
    );
  }
}
