import 'package:flutter/material.dart';
import 'package:recipes/screens/filters_screens.dart';

class MainDrawer extends StatelessWidget {


  Widget buildListTile(String title, IconData icon,Function onTabHandler) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        title,
        style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoCondensed'),
      ),
      onTap: onTabHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            color: Theme.of(context).accentColor,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            height: 150,
            width: double.infinity,
            child: Text(
              "Cooking Up ",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),

          buildListTile("Meal", Icons.restaurant,(){Navigator.of(context).pushReplacementNamed('/');}),

          buildListTile("Filters", Icons.settings,(){Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);}),
        ],
      ),
    );
  }
}
