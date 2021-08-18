import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mealsapp/dummy_data.dart';
import 'package:mealsapp/models/meal.dart';
import 'package:mealsapp/screens/category_meals_screen.dart';
import 'package:mealsapp/screens/filters_screen.dart';
import 'package:mealsapp/screens/meal_detail_screen.dart';
import 'package:mealsapp/screens/tabs_screen.dart';
import 'screens/categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String,dynamic> _filters = {
    "gluten":false,
    "lactose":false,
    "vegan":false,
    "vegetarian":false
  };
  List<Meal> favorited=[];

  void _setFilters(Map <String,dynamic> filterData)
  {
    setState(() {
      _filters = filterData;
      _availaiblemeal=DUMMY_MEALS.where((meal) {
      if(_filters['gluten']==true && !meal.isGlutenFree)
      {
        return false;
      }
      if(_filters['lactose']==true && !meal.isLactoseFree){
        return false;
      }
      if(_filters['vegan']==true && !meal.isVegan){
        return false;
      }
      if(_filters['vegetarian']==true && !meal.isVegetarian){
        return false;
      }
      return true;

      }).toList();
    });

  }
  bool ismealfavorite(String mealid)
  {
    return favorited.any((element) => element.id==mealid);
  }
  List<Meal> _availaiblemeal= DUMMY_MEALS;

  void togglefavorite(String mealid)
  {
    final extistingindex =favorited.indexWhere((element) => element.id==mealid);
    if(extistingindex >= 0)
    {
      setState(() {
        favorited.removeAt(extistingindex);
      });

    }
    else{
      setState(() {
        favorited.add(DUMMY_MEALS.firstWhere((element) => element.id==mealid));
      });
      
    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
            bodyText2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
            headline6: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold)),
      ),
      // home: CategoriesScreen(),
      // initialRoute: '/',
      routes: {
        '/': (ctx) => TabScreen(favorited),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(_availaiblemeal),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(togglefavorite,ismealfavorite),
        FilterScreem.routeName:(ctx)=> FilterScreem(_filters,_setFilters)
      },
      onGenerateRoute: (settings) {
        print(settings.arguments);
        // if (settings.name == '/meal-detail') {
        //   return ...;
        // } else if (settings.name == '/something-else') {
        //   return ...;
        // }
        // return MaterialPageRoute(builder: (ctx) => CategoriesScreen(),);
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen(),);
      },
    );
  }
}
