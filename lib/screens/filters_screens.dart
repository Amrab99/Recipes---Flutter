import 'package:flutter/material.dart';
import 'package:recipes/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function _saveFilters;
  final Map<String , bool> currentFilters;

  FiltersScreen(this._saveFilters,this.currentFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _isGlutenFree = false;
  bool _isLactoseFree = false;
  bool _isVegan = false;
  bool _isVegetarian = false;

  @override
  initState(){
     _isGlutenFree =widget.currentFilters['gluten'] ;
     _isLactoseFree = widget.currentFilters['lactose'];
     _isVegan = widget.currentFilters['vegan'];
     _isVegetarian = widget.currentFilters['vegetarian'];
     super.initState();
  }

  Widget buildSwitchListTile(
      String title, bool value, String subTitle, Function onChange) {
    return SwitchListTile(
        title: Text(title),
        value: value,
        subtitle: Text(subTitle),
        onChanged: onChange);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text("Your filters", style: Theme.of(context).textTheme.headline1),
        actions: [
          IconButton(
              onPressed: (){
                final Map<String, bool> selectedFilters={
                  'gluten': _isGlutenFree,
                  'lactose': _isLactoseFree,
                  'vegan': _isLactoseFree,
                  'vegetarian': _isVegetarian,
                };
                widget._saveFilters(selectedFilters);
              },
              icon: const Icon(Icons.save),

          )
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection:',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              buildSwitchListTile('Gluten-Free', _isGlutenFree,
                  'Only include gluten-free meals', (newvalue) {
                setState(() {
                  _isGlutenFree = newvalue;
                });
              }),
              buildSwitchListTile('Lactose-Free', _isLactoseFree,
                  'Only include Lactose-free meals', (newvalue) {
                setState(() {
                  _isLactoseFree = newvalue;
                });
              }),
              buildSwitchListTile('Vegan', _isVegan, 'Only include Vegan meals',
                  (newvalue) {
                setState(() {
                  _isVegan = newvalue;
                });
              }),
              buildSwitchListTile(
                  'Vegetarian', _isVegetarian, 'Only include Vegetarian meals',
                  (newvalue) {
                setState(() {
                  _isVegetarian = newvalue;
                });
              }),
            ],
          )),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
