import 'package:flutter/material.dart';

import '../screens/category_meal_screen.dart';
class CategoryItem extends StatelessWidget {

  final String id;
  final String title;
  final Color color;

  CategoryItem(this.id, this.title, this.color, {Key key}) : super(key: key);

  TextStyle style1=const TextStyle(fontSize: 24,fontFamily: 'RobotoCondensed',fontWeight: FontWeight.bold);

  void selectCategory(BuildContext ctx){
    Navigator.of(ctx).pushNamed(CategoryMealScreen.routeName,
      arguments: {
        'id':id,
        'title':title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      onTap: ()=>selectCategory(context),
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.5),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(title,style:style1,),
      ),
    );
  }
}
