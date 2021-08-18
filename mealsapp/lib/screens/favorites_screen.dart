import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
class Favorites extends StatelessWidget {
  final List favorites;
  Favorites(this.favorites);

  @override
  Widget build(BuildContext context) {
    if(favorites.isEmpty)
    {
      return Center(child: Text("You Have No Favorites Start Adding some"),);
    }
    else{
      return
      ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              title: favorites[index].title,
              duration: favorites[index].duration,
              affordability: favorites[index].affordability,
              complexity: favorites[index].complexity,
              imageURL: favorites[index].imageUrl,
              id: favorites[index].id,
              
              
            );
          },
          itemCount: favorites.length,
        );
    }
    
  }
}