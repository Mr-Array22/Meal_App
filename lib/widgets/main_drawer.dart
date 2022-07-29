import 'package:flutter/material.dart';

import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key key}) : super(key: key);


Widget buildListTile(String text,IconData icon,Function tapHandler){
  return ListTile(
    onTap: tapHandler,
    leading: Icon(icon,size: 26,),
    title: Text(text,style: const TextStyle(
      fontSize: 24,
      fontFamily: 'RobotoCondensed',
      fontWeight: FontWeight.bold,
    ),),
  );
}


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            color: Theme.of(context).colorScheme.secondary,
            alignment: Alignment.centerLeft,
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            child: const Text("Cooking Up!",style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w900,
              color: Colors.pinkAccent
            ),),
          ),
          const SizedBox(height: 20,),
          buildListTile("Meal",Icons.restaurant,(){Navigator.of(context).pushReplacementNamed('/');}),
          buildListTile("Filters",Icons.settings,(){Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);}),
        ],
      ),
    );
  }
}
