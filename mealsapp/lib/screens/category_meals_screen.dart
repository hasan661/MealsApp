import 'package:flutter/material.dart';
import 'package:mealsapp/widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/categories_meals';

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  late String categoryTitle;
  late List displayedMeals;
  bool _loadedInitData=false;


  @override
  void didChangeDependencies() {
    if(_loadedInitData!=false){
    final routeArgs =ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    categoryTitle = routeArgs['title'].toString();
    final String id = routeArgs['id'].toString();
    final diplayedMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(id);
    }).toList();
    _loadedInitData=true;
    }
    
    super.didChangeDependencies();
  }

  void _removeMeal(String mealid){
    setState(() {
      displayedMeals.removeWhere((element) => element.id==mealid);
      
    });

  }
  @override
  Widget build(BuildContext context) {
    
    

    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              title: displayedMeals[index].title,
              duration: displayedMeals[index].duration,
              affordability: displayedMeals[index].affordability,
              complexity: displayedMeals[index].complexity,
              imageURL: displayedMeals[index].imageUrl,
              id: displayedMeals[index].id,
              deleteitem: _removeMeal,
              
            );
          },
          itemCount: displayedMeals.length,
        ));
  }
}
