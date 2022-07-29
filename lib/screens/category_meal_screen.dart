import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';


class CategoryMealScreen extends StatefulWidget {

  static const routeName='category_meal';

  final List<Meal>_availableMeals;
  const CategoryMealScreen(this._availableMeals);

  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {

  String categoryTitle;
  List<Meal> displayMeals;
  @override
  void didChangeDependencies() {
    final routeArg=ModalRoute.of(context).settings.arguments as Map<String,String>;
    final categoryId=routeArg['id'];
    categoryTitle=routeArg['title'];
    displayMeals=widget._availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }
    ).toList();
  }


  @override
  Widget build(BuildContext context) {




    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle)),
      body: ListView.builder(
        itemBuilder: (ctx,index){
          return MealItem(
            id:displayMeals[index].id ,
            imagUrl: displayMeals[index].imageUrl,
            title: displayMeals[index].title,
            duration: displayMeals[index].duration,
            complexity: displayMeals[index].complexity,
            affordability: displayMeals[index].affordability,
          );
        },
        itemCount:displayMeals.length,
      ),
    );
  }
}
