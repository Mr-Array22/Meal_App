import 'package:flutter/material.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {

  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String,bool>  currentFilters;
  const FiltersScreen(this.currentFilters,this.saveFilters, {Key key}) : super(key: key);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {

  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegan = false;
  bool _vegetarian = false;

  @override
  initState(){
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegan = widget.currentFilters['vegan'];
    _vegetarian = widget.currentFilters['vegetarian'];
    super.initState();
  }

  Widget bulidListtile(String title, String sub, bool currentvalue,
      Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentvalue,
      subtitle: Text(sub),
      onChanged: updateValue,
    );
  }

  TextStyle style3 = const TextStyle(fontSize: 25, fontWeight: FontWeight.w900, fontFamily: 'RobotoCondensed');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Your Filters"),
        actions: [
          IconButton(
              onPressed:(){
                final selectedFilters={
                  'gluten':_glutenFree,
                  'lactose':_lactoseFree,
                  'vegan':_vegan,
                  'vegetarian':_vegetarian,
                };
                widget.saveFilters(selectedFilters);
                },
              icon: const Icon(Icons.save)
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text("Adjust Your Meal Selection", style: style3,),
          ),
          Expanded(
            child: ListView(
              children: [
                bulidListtile(
                  "Gluten-free",
                  "Only include gluten-free meals",
                  _glutenFree,
                      (newvalue) {
                    setState(() {
                      _glutenFree = newvalue;
                    });
                  },
                  ),
                bulidListtile(
                  "Lactose-free",
                  "Only include lactose-free meals",
                  _lactoseFree,
                      (newvalue) {
                    setState(() {
                      _lactoseFree = newvalue;
                    });
                  },
                ),
                bulidListtile(
                  "Vegan-free",
                  "Only include vegan-free meals",
                  _vegan,
                      (newvalue) {
                    setState(() {
                      _vegan = newvalue;
                    });
                  },
                ),
                bulidListtile(
                  "Vegetarian-free",
                  "Only include vegetarian-free meals" ,
                  _vegetarian,
                      (newvalue) {
                    setState(() {
                      _vegetarian = newvalue;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}







