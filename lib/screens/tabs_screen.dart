import 'package:flutter/material.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/fav_screeen.dart';
import '../models/meal.dart';
import '../widgets/main_drawer.dart';

class TbasScreen extends StatefulWidget {
  final List<Meal> favMeals;
  const TbasScreen(this.favMeals);


  @override
  State<TbasScreen> createState() => _TbasScreenState();
}

class _TbasScreenState extends State<TbasScreen> {


  List<Map<String,Object>> _pages;
  int selectedpageindex=0;


  @override
  void initState(){
   _pages=[
    {
      'page':const CategoriesScreen(),
      'title':'Categories',
    },
    {
      'page':FavScreen(widget.favMeals),
      'title':'Your Favorites',
    },
  ];
    super.initState();
  }
  void _selectpage(int value) {
    setState(() {
      selectedpageindex=value;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[selectedpageindex]['title']),
      ),
      body: _pages[selectedpageindex]['page'],
      bottomNavigationBar:BottomNavigationBar(
        backgroundColor: Colors.pink,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        unselectedItemColor: Colors.white,
        currentIndex: selectedpageindex,
        onTap:_selectpage ,
        items:const [
          BottomNavigationBarItem(
            icon:Icon(Icons.category),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon:Icon(Icons.favorite),
            label: "Favorites",
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }


}

