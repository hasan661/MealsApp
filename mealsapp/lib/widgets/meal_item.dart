import 'package:flutter/material.dart';
import '/models/meal.dart';

class MealItem extends StatelessWidget {
  final title;
  final imageURL;
  final int duration;
  final Complexity;
  final Affordability;

  MealItem({required this.title, required this.duration, required this.Affordability, required this.Complexity, required this.imageURL});
  // const MealItem({ Key? key }) : super(key: key);
  void selectMeal() {}

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: selectMeal,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(children: [
          Stack(children: [
            ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
              child: Image.network(imageURL, height: 250, width: double.infinity, fit: BoxFit.cover,),
            ),
          ],)
        ],),
      ),
    );
  }
}
