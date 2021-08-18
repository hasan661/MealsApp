import 'package:flutter/material.dart';
import 'package:mealsapp/screens/categories_screen.dart';
import 'package:mealsapp/screens/favorites_screen.dart';
import 'package:mealsapp/widgets/main_drawer.dart';

class TabScreen extends StatefulWidget {
  List favorites;
  TabScreen(this.favorites);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<Map<String,dynamic>> _pages=[];
  int _selectedpageindex=0;
  void _selectpage(int index) {
    setState(() {
      _selectedpageindex=index;
    });

  }

  @override
  void initState() {
    // TODO: implement initState
    _pages=[
    {
      "page": CategoriesScreen(),
      "title":"Categories"

    },
    {
      "page":Favorites(widget.favorites),
      "title":"Your Favorites"
    }
    ,
    
  ];
  }
  @override
  Widget build(BuildContext context) {
    // return DefaultTabController(
    //   length: 2,
    //   child: Scaffold(
    //     appBar: AppBar(
    //       title: Text("Meals"),
    //       bottom: TabBar(
    //         tabs: [
    //           Tab(
    //             icon: Icon(Icons.category),
    //             text: "Categories",
    //           ),
    //           Tab(
    //               icon: Icon(
    //                 Icons.star,
    //               ),
    //               text: "Favorites"),
    //         ],
    //       ),
    //     ),
    //     body: TabBarView(children: [CategoriesScreen(), Favorites()]),
    //   ),
    // );
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedpageindex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedpageindex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectpage,
        items: [
          BottomNavigationBarItem(
            // backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            // backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            label: "Favorites",
          ),
        ],
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedpageindex,
        // type: BottomNavigationBarType.shifting,
      ),
    );
  }
}
