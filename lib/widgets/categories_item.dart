import 'package:flutter/material.dart';
import 'package:recipes/screens/meals_categories_screen.dart';

class CategoriesItems extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  const CategoriesItems(this.id, this.title, this.color);

  void selectedCategory(BuildContext context) {
    Navigator.of(context)
        .pushNamed(MealsCategoriesScreen.routeName, arguments: {
      'id': id,
      'title': title,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        selectedCategory(context);
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.all(20),
        child: Text(title, style: Theme.of(context).textTheme.headline1),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            color.withOpacity(0.5),
            color,
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(15),
          //color: color,
        ),
      ),
    );
  }
}
