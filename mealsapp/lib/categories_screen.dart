import 'package:flutter/material.dart';
import 'package:mealsapp/category_item.dart';

import 'dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Meal Decider"),),
      body: GridView(
        padding: const EdgeInsets.all(25),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [...DUMMY_CATEGORIES.map((e) => CategoryItem(e.title,e.color,e.id)).toList(),]
    ),);
  }
}
