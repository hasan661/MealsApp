import 'package:flutter/material.dart';
import 'package:mealsapp/widgets/main_drawer.dart';

class FilterScreem extends StatelessWidget {
  // const FilterScreem({ Key? key }) : super(key: key);
  static const routeName = "/Filters";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
      ),
      drawer: MainDrawer(),
    );
  }
}