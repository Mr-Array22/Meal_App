import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import '../widgets/meal_item.dart';
class FavScreen extends StatelessWidget {

  final List<Meal> favMeals;
  const FavScreen(this.favMeals);


  @override
  Widget build(BuildContext context) {

    if(favMeals.isEmpty){
      return const Center(
        child: Text("You Don't have any favorites yet"),
      );
    }
    else{
      return ListView.builder(
        itemBuilder: (ctx,index){
          return MealItem(
            id:favMeals[index].id ,
            imagUrl: favMeals[index].imageUrl,
            title: favMeals[index].title,
            duration: favMeals[index].duration,
            complexity: favMeals[index].complexity,
            affordability: favMeals[index].affordability,
          );
        },
        itemCount:favMeals.length,
      );
    }

  }
}
