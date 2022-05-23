import 'package:flutter/material.dart';
import 'package:recipes/modules/meal.dart';
import 'package:recipes/widgets/meal_item.dart';

class FavoriteScreens extends StatelessWidget {
  final List<Meal> favoriteMeals;

  FavoriteScreens(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return  Center(
          child: Text(
              "You have no favorite meals yet - start adding some !!",style: Theme.of(context).textTheme.headline1));
    }
    else{
      return ListView.builder(
          itemBuilder: (context, index) {
            return MealItem(
              id: favoriteMeals[index].id,
              title: favoriteMeals[index].title,
              affordability: favoriteMeals[index].affordability,
              complexity: favoriteMeals[index].complexity,
              duration: favoriteMeals[index].duration,
              imageUrl: favoriteMeals[index].imageUrl,
            );
          },
          itemCount: favoriteMeals.length);
    }
  }
}
