import 'package:flutproj2/models/category_model.dart';
import 'package:flutproj2/models/recipe_model.dart';
import 'package:flutter/material.dart';
import 'package:flutproj2/ui/recipes_list.dart';
class Plug extends StatefulWidget{
  final CategoryModel category;
  const Plug({Key? key, required this.category}) : super(key: key);
  @override
  _PlugState createState() => _PlugState();
}
class _PlugState extends State<Plug>{

  @override
  Widget build(BuildContext context) {
    Type type = widget.category.runtimeType;
    return Scaffold(

      appBar:
      AppBar(
        title: Text("Подобранные рецепты"),
      ),
      body: SafeArea(
          child:Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: const BoxDecoration(
                    image:  DecorationImage(image: AssetImage("assets/background.jpg"),
                      fit: BoxFit.cover,),
                  ),
                  child: RecipesListUI(
                      recipes: RecipeModel.demoRecipes.where((element) => element.category.runtimeType == type).toList()
                  )
                )
              ]
          )
      ),
    );
  }
}
