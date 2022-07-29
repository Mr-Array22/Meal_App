import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
class MealDetailScreen extends StatelessWidget {

  static const routeName='meal_detail';
  final Function togglefav;
  final Function isfav;
  final style2=const TextStyle(fontSize: 20,fontFamily:'RobotoCondensed',fontWeight: FontWeight.bold);

  const MealDetailScreen(this.togglefav,this.isfav);

  Widget buildSectiontitle(String text){
    return Text(text,style:style2);
  }

  Widget buildContainer(Widget child){
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 160,
      width: 300,
      child: child,
    );
  }


  @override
  Widget build(BuildContext context) {

    final mealId=ModalRoute.of(context).settings.arguments as String;
    final selectedMeal=DUMMY_MEALS.firstWhere((meal)=> meal.id==mealId);


    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
        children: [
          SizedBox(
            height: 300,
            width: double.infinity,
            child: Image.network(selectedMeal.imageUrl,fit: BoxFit.cover,),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Container(
              padding:const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(20),
                shape: BoxShape.rectangle,
              ),
                child: buildSectiontitle("Ingredients"),
            ),
          ),
          buildContainer(ListView.builder(
              itemBuilder:(ctx,index)=> Card(
                color: Theme.of(context).colorScheme.secondary,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 10),
                  child: Text(selectedMeal.ingredients[index]),
                ),
              ),
              itemCount:selectedMeal.ingredients.length ,
            ),),
          Container(
            margin:const EdgeInsets.symmetric(vertical: 10),
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(20),
                shape: BoxShape.rectangle,
              ),
              child: buildSectiontitle("Steps"),
            ),
          ),
          buildContainer(ListView.builder(
              itemBuilder:(ctx,index)=>Column(
                children: [
                  ListTile(
                    leading:CircleAvatar(
                      backgroundColor: Colors.amber,
                      child: Text("${index+1}",style:const TextStyle(color: Colors.white),),
                    ) ,
                    title: Text(selectedMeal.steps[index]),
                  ),
                  const Divider(),
                ],
              ),
              itemCount:selectedMeal.steps.length ,
            ),),
        ],
      ),
    ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>togglefav(mealId),
        child: Icon(
            isfav(mealId)?Icons.star:Icons.star_border
        ),
      ),
    );
  }
}
