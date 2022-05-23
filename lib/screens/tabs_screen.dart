import 'package:flutter/material.dart';
import 'package:recipes/modules/meal.dart';
import 'package:recipes/screens/categories_screen.dart';
import 'package:recipes/screens/favorite_screens.dart';
import 'package:recipes/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {

  final List<Meal> favoriteMeals;
  const TabsScreen(this.favoriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();

}

class _TabsScreenState extends State<TabsScreen> {

  List _pages ;
  int _selectedPageIndex =0 ;

  @override
  void initState() {
    _pages = [
      {
        'page':CategoriesScreen(),
        'title':'MEALS CATEGORIES'
      },
      {
        'page':FavoriteScreens(widget.favoriteMeals),
        'title':'Favorites Meals'
      }
    ];
    super.initState();
  }
  void selectedItem(int value) {
  setState(() {
    _selectedPageIndex=value;
  });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_pages[_selectedPageIndex]['title']),),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectedItem,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.category_outlined), title: Text("Categories")),
          BottomNavigationBarItem(icon: Icon(Icons.favorite),title: Text("Favorite"))
        ],
      ),
      drawer: MainDrawer(),
    );
  }


}
