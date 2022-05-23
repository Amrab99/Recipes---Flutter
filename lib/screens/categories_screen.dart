import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipes/dummy_data.dart';
import 'package:recipes/widgets/categories_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
          padding: const EdgeInsets.all(35),
          children:
            DUMMY_CATEGORIES.map((catData) => CategoriesItems(catData.id, catData.title, catData.color)).toList(),
          //Max cross axis extent <--------->
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20)),
    );
  }
}
