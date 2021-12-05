import 'package:flutproj2/models/category_model.dart';
import 'package:flutproj2/models/recipe_model.dart';
import 'package:flutter/material.dart';
import 'package:flutproj2/ui/recipes_list.dart';
class Final extends StatefulWidget{
  final CategoryModel category;
  const Final({Key? key, required this.category}) : super(key: key);
  @override
  _FinalState createState() => _FinalState();
}
class _FinalState extends State<Final>{

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
