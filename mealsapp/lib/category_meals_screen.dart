import 'package:flutter/material.dart';
import 'dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/categories_meals';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final String categoryTitle = routeArgs['title'].toString();
    final String id = routeArgs['id'].toString();
    final categoryMeals =DUMMY_MEALS.where((meal){
      return meal.categories.contains(id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(itemBuilder: (ctx,index){
        return Text(categoryMeals[index].title);
      },itemCount: categoryMeals.length,)
    );
  }
}
