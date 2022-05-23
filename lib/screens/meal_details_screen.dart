import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipes/dummy_data.dart';
import 'package:recipes/widgets/main_drawer.dart';
class MealDetailsScreen extends StatelessWidget {
  static const routeName = 'meal_details';

  Function _toggleFavorite;

  Function isFavorite;

  MealDetailsScreen(this._toggleFavorite,this.isFavorite);

  Widget buildSelectionTitle(BuildContext context, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Text(text, style: Theme.of(context).textTheme.subtitle1),
    );
  }

  Widget buildSelectionText(child) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(20),
        height: 150,
        width: 300,
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(title: Text(selectedMeal.title)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSelectionTitle(context, "ingredients"),
            buildSelectionText(
              ListView.builder(
                  itemBuilder: (ctx, index) => Card(
                        color: Theme.of(context).accentColor,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          child: Text(selectedMeal.ingredients[index]),
                        ),
                      ),
                  itemCount: selectedMeal.ingredients.length),
            ),
            buildSelectionTitle(context, "Steps"),
            buildSelectionText(
              ListView.builder(
                  itemBuilder: (ctx, index) => Column(
                    children: [
                      ListTile(
                        leading: const Icon(
                          Icons.all_inclusive,

                        ),
                        title: Text(selectedMeal.steps[index]),
                      ),
                      const Divider(),
                    ],
                  ),
                  itemCount: selectedMeal.steps.length),
            ),
          ],
        ),
      ),
      drawer: MainDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _toggleFavorite(mealId);
        },
        child: Icon(
            isFavorite(mealId) ? Icons.star : Icons.star_border
        ),
      ),
    );
  }
}
