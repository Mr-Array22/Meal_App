import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/filters_screen.dart';
import 'package:meal_app/screens/meal_detail_screen.dart';
import 'package:meal_app/screens/tabs_screen.dart';
import './screens/category_meal_screen.dart';

void main() => runApp(const MyApp());


class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);


  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Map<String,bool> _filters={
    'gluten':false,
    'lactose':false,
    'vegan':false,
    'vegetarian':false,
  };

  List<Meal> _availableMeals=DUMMY_MEALS;
  final List<Meal> _favMeals=[];
  void _setFilters(Map<String,bool> filterData){
    setState(() {
      _filters=filterData;
      _availableMeals=DUMMY_MEALS.where((meal) {
        if(_filters['gluten']&& !meal.isGlutenFree) {
          return false;
        }
        if(_filters['lactose']&& !meal.isLactoseFree) {
          return false;
        }
        if(_filters['vegan']&& !meal.isVegan) {
          return false;
        }
        if(_filters['vegetarian']&& !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _togglefavorites(String mealId){
    final existingIndex=_favMeals.indexWhere((meal) =>meal.id==mealId);
    if(existingIndex>=0){
      setState(() {
        _favMeals.removeAt(existingIndex);
      });
    }
    else{
      setState(() {
        _favMeals.add(DUMMY_MEALS.firstWhere((meal) =>meal.id==mealId));
      });
    }
  }

  bool _ismealFav(String id){
    return _favMeals.any((meal) => meal.id==id);
  }
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meal App',
      theme: ThemeData(
          canvasColor: const Color.fromRGBO(255, 254, 229,1),
          textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: const TextStyle(color:Color.fromRGBO(20, 50, 50, 1)),
            bodyText2: const TextStyle(color:Color.fromRGBO(20, 50, 50, 1)),
          ), colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink).copyWith(secondary: Colors.amber).copyWith(secondary: Colors.amber),
      ),
      //home: CategoriesScreen(),
      routes: {
        '/':(context)=> TbasScreen(_favMeals),
        CategoryMealScreen.routeName:(context)=>CategoryMealScreen(_availableMeals),
        MealDetailScreen.routeName:(context)=>MealDetailScreen(_togglefavorites,_ismealFav),
        FiltersScreen.routeName:(context)=>FiltersScreen(_filters,_setFilters),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);



  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Meal App"),
      ),
      body: null,
    );
  }
}

