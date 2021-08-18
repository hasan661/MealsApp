import 'package:flutter/material.dart';
import 'package:mealsapp/widgets/main_drawer.dart';

class FilterScreem extends StatefulWidget {
  // const FilterScreem({ Key? key }) : super(key: key);
  static const routeName = "/Filters";
  final Function saveFilters;
  final Map<String,dynamic> currentfilters;
  FilterScreem(this.currentfilters,this.saveFilters);


  @override
  _FilterScreemState createState() => _FilterScreemState();
}

class _FilterScreemState extends State<FilterScreem> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;
  @override
  
    
  initState(){
 _glutenFree = widget.currentfilters['gluten'];
  _vegetarian = widget.currentfilters['vegetarian'];
  _vegan = widget.currentfilters['vegan'];
  _lactoseFree = widget.currentfilters['lactose'];

  }
  
  


  

  

  Widget _buildSwitchListTile(
    String title,
    String description,
    bool currentValue,
    dynamic updateValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(
        description,
      ),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
        actions: [
          IconButton(
              onPressed: () {
                final _selectedFilters = {
                  "gluten": _glutenFree,
                  "lactose": _lactoseFree,
                  "vegan": _vegan,
                  "vegetarian": _vegetarian
                };
                widget.saveFilters(_selectedFilters);
              },
              icon: Icon(Icons.save))
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Adjust Your meal selection",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
              child: ListView(children: <Widget>[
            _buildSwitchListTile(
              'Gluten-free',
              'Only include gluten-free meals.',
              _glutenFree,
              (newValue) {
                setState(
                  () {
                    _glutenFree = newValue;
                  },
                );
              },
            ),
            _buildSwitchListTile(
              'Lactose-free',
              'Only include lactose-free meals.',
              _lactoseFree,
              (newValue) {
                setState(
                  () {
                    _lactoseFree = newValue;
                  },
                );
              },
            ),
            _buildSwitchListTile(
              'Vegetarian',
              'Only include vegetarian meals.',
              _vegetarian,
              (newValue) {
                setState(
                  () {
                    _vegetarian = newValue;
                  },
                );
              },
            ),
            _buildSwitchListTile(
              'Vegan',
              'Only include vegan meals.',
              _vegan,
              (newValue) {
                setState(
                  () {
                    _vegan = newValue;
                  },
                );
              },
            )
          ]))
        ],
      ),
    );
  }
}
